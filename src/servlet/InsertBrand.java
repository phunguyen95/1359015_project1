package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by 13590_000 on 6/19/2015.
 */
@WebServlet(name = "InsertBrand")
public class InsertBrand extends HttpServlet {

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
            String name=request.getParameter("name");
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        Connection con;

        try
        {
            con = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            String query="insert into brand (b_name)  values (?)";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1,name);
            pstmt.executeUpdate();
            pstmt.close();

        }
        catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
    response.sendRedirect("deleteband.jsp");
}

}
