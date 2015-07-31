package controller;

import com.mypackage.Recipe;
import controller.ClothesCart;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.List;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import javax.imageio.ImageIO;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

/**
 * Created by 13590_000 on 6/1/2015.
 */
public class FileUpload  extends HttpServlet {
    static {
        try {
            //loads com.mysql.jdbc.Driver into memory
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException cnf) {
            System.out.println("Driver could not be loaded" + cnf);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        HttpSession session = request.getSession();
        String user = (String)session.getAttribute("userid");
        String name=(String)session.getAttribute("fname");
        String telephone=(String)session.getAttribute("telephone");
        String address=(String)session.getAttribute("address");
           float price=(Float)session.getAttribute("total");
        int id = 0;
        java.util.List<ClothesCart> a= (java.util.List<ClothesCart>) session.getAttribute("list");
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        Connection con;
        PrintWriter out = response.getWriter();
        try {
            con = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement pstmt = con.prepareStatement("insert into recipe (user,name,price,telephone,address,date) values (?,?,?,?,?,NOW())",PreparedStatement.RETURN_GENERATED_KEYS);
            pstmt.setString(1,user);
            pstmt.setString(2, name);
            pstmt.setFloat(3, price);
            pstmt.setString(4,telephone);
            pstmt.setString(5,address);
            int i=pstmt.executeUpdate();
            ResultSet rs = pstmt.getGeneratedKeys();
            if(rs.next())
            {
                id  = rs.getInt(1);
            }
            while(rs.next())
            {
                int status=rs.getInt(6);
                session.setAttribute("status", status);
            }

            for(ClothesCart b: a){
                checkout(id,b.getId(),b.getName(),b.getTotal(),b.getPrice(),b.getPicture());
            }
            session.removeAttribute("fBuy");
            session.removeAttribute("list");
            session.removeAttribute("listBuy");
        } catch (SQLException sqle) {
            out.println("SQL Exception thrown: " + sqle);
        }

        response.sendRedirect("submitToPaid.jsp");

    }

    public void checkout(int receiptid,int id,String name,int quantity,int price,String picture)
    {
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        Connection con;
        try
        {
            con = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            String query="insert into receiptdetail(recipeid,p_id,name,quantity,price,total,picture)  values (?,?,?,?,?,?,?)";
           PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setInt(1,receiptid);
            pstmt.setInt(2,id);
            pstmt.setString(3,name);
            pstmt.setInt(4, quantity);
            pstmt.setInt(5, price);
                pstmt.setFloat(6, quantity*price);
            pstmt.setString(7,picture);
            pstmt.executeUpdate();
            pstmt.close();

        }
        catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
    }
}
