package com.mypackage;

import java.sql.*;

/**
 * Created by 13590_000 on 5/19/2015.
 */
public class Category {
    static{
        try{
            //loads com.mysql.jdbc.Driver into memory
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch(ClassNotFoundException cnf){
            System.out.println("Driver could not be loaded" + cnf);
        }
    }

    private int _catid;
    private String _name;
    public int getID(){return _catid;}
    public void setID(int value){_catid = value;}
    public String getName(){return _name;}
    public void setName(String value){_name = value;}
    public Category()
    {

    }

    public Category(int id,String name)
    {
        _catid=id;
        _name=name;
    }
    public boolean update(Category cat)
    {
        boolean success=false;
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = null;
        try {
            Connection con = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement pstmt = null;
            sql="UPDATE Category set catname=? where catid =? ";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,cat._name);
            pstmt.setInt(2,cat._catid);
            int count=pstmt.executeUpdate();
            success=(count==1);
            pstmt.close();

            if (con != null) {
                con.close();
                con = null;
            }

        } catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return success;
    }
    public boolean DeletebyID(int id)
    {
        boolean success=false;
        String database ="clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = null;
        try {
            Connection con = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement pstmt = null;
            sql="DELETE  from category where  catid=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
        int count=    pstmt.executeUpdate();
            success=(count==1);
            if (con != null) {
                con.close();
                con = null;
            }

        } catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return success;
    }
    public Category insert(Category cat)
    {

            boolean success=false;
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";

        try {
            Connection con = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement pstmt = null;
            String query = "insert into category(catname ) values(? ) ";
            pstmt = con.prepareStatement(query,PreparedStatement.RETURN_GENERATED_KEYS); // create a statement
            pstmt.setString(1,cat._name);
           int count= pstmt.executeUpdate();
            success=(count==1);
            ResultSet rs = pstmt.getGeneratedKeys();
            if(rs.next())
            {
                int id  = rs.getInt(1);
                cat._catid=id;

            }
            if (con != null) {
                con.close();
                con = null;
            }

        }

        catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return cat;
    }
}
