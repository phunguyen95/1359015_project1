package com.mypackage;

/**
 * Created by 13590_000 on 5/21/2015.
 */
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import javax.imageio.ImageIO;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Random;
import javax.servlet.http.HttpSession;

import java.awt.Color;
import java.awt.Font;
import java.awt.GradientPaint;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.*;

import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.*;
import javax.servlet.http.*;
  import nl.captcha.Captcha;


public class SignUpServlet extends HttpServlet {
    static{
        try{
            //loads com.mysql.jdbc.Driver into memory
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch(ClassNotFoundException cnf){
            System.out.println("Driver could not be loaded" + cnf);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        Connection connection;
        response.setContentType("text/html");
        String u = request.getParameter("fname");
        String l= request.getParameter("lname");
        String p = request.getParameter("pword");
        String e = request.getParameter("email");
        String c = request.getParameter("ucountry");
        String n=request.getParameter("uname");
        String address=request.getParameter("address");
        String telephone=request.getParameter("telephone");
        try {
            connection = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement stmt = connection.prepareStatement("insert into Member (fname,lname,email,country,password,username,date,address,telephone) values (?,?,?,?,?,?,NOW(),?,?)");
            stmt.setString(1,u);
            stmt.setString(2,l);
            stmt.setString(3,e);
            stmt.setString(4,c);
            stmt.setString(5,p);
            stmt.setString(6,n);
            stmt.setString(7,address);
            stmt.setString(8,telephone);
            int i = stmt.executeUpdate();
            if (i > 0) {
                response.sendRedirect("index.jsp");
            }

        }
        catch (SQLException sqle) {
            out.println("SQL Exception thrown: " + sqle);
        }

        out.close();
    }

}