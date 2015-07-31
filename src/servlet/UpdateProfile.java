package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

/**
 * Created by 13590_000 on 6/13/2015.
 */
@WebServlet(name = "UpdateProfile")
public class UpdateProfile extends HttpServlet {
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
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession();
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        Connection connection;
        response.setContentType("text/html");
            String password=request.getParameter("password");
        String fname=request.getParameter("fname");
        String lname=request.getParameter("lname");
        String email=request.getParameter("email");
        String address=request.getParameter("address");
        String telephone=request.getParameter("telephone");
        ResultSet rs=null;

        try{
    connection = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
      String sql="Update member set password = ?, fname = ?, lname = ?, email = ?, address = ?, telephone = ? where id=?";

    PreparedStatement update = connection.prepareStatement(sql);
    update.setString(1, password);
    update.setString(2, fname);
    update.setString(3, lname);
    update.setString(4, email);
    update.setString(5, address);
    update.setString(6, telephone);
    update.setInt(7, (Integer) session.getAttribute("iduser"));
            session.setAttribute("fname",fname);
            session.setAttribute("lname",lname);
            session.setAttribute("email",email);
            session.setAttribute("address",address);
            session.setAttribute("telephone",telephone);
       update.executeUpdate();


        }
      catch (SQLException sqle) {
        out.println("SQL Exception thrown: " + sqle);
    }
    response.sendRedirect("profile.jsp");
}
}
