package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by 13590_000 on 6/18/2015.
 */
import javax.servlet.http.*;
import java.io.IOException;
import javax.servlet.ServletException;
import java.sql.*;

@WebServlet(name = "DeleteProduct")
public class DeleteProduct extends HttpServlet {
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
        int _masp = 0;
        String masp = request.getParameter("masp");
        if (masp != null) {
            _masp = Integer.parseInt(masp);
        }
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        Connection connection;

        String sqlqueary = "delete from product where id=?";
        try{
            connection = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement update = connection.prepareStatement(sqlqueary);
            update.setInt(1,_masp);
            update.executeUpdate();
        }
        catch (SQLException sqle) {

            System.out.println("SQL Exception thrown: " + sqle);
        }
        response.sendRedirect("removeband.jsp");
    }


}
