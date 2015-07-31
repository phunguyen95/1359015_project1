package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.nimbus.State;
import java.io.IOException;
import java.sql.*;

/**
 * Created by 13590_000 on 6/19/2015.
 */
@WebServlet(name = "RemoveBand")

public class RemoveBand extends HttpServlet {

    static{
        try{
            //loads com.mysql.jdbc.Driver into memory
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch(ClassNotFoundException cnf){
            System.out.println("Driver could not be loaded" + cnf);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session=request.getSession();
        int _masp = 0;
            String a="";
        String masp = request.getParameter("idsp");
        if (masp != null) {
            _masp = Integer.parseInt(masp);
        }
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        Connection con;

        try
        {
            con = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            String query="DELETE  from brand where b_id="+_masp+"" ;
            String query2="delete from product where b_id="+_masp+"";
           Statement pstmt=con.prepareStatement(query);
            Statement pstmt2=con.prepareStatement(query2);
           pstmt.executeUpdate(query);
            pstmt2.executeUpdate(query2);
             a="Insert succesfully";
            session.setAttribute("noti",a);

        }

        catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        session.setAttribute("noti",a);

        response.sendRedirect("deleteband.jsp");
    }

}
