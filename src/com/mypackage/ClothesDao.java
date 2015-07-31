package com.mypackage;
/**
 * Created by 13590_000 on 5/19/2015.
*/


import controller.ClothesCart;

import javax.servlet.http.HttpSession;
import java.applet.Applet;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


/**
 * Created by 13590_000 on 5/19/2015.
 */
public class ClothesDao {
    private int noOfRecords;
    Statement stmt;
    Connection conn;

    static {
        try {
            //loads com.mysql.jdbc.Driver into memory
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException cnf) {
            System.out.println("Driver could not be loaded" + cnf);
        }
    }

    public ClothesDao() {
    }

    public List<Category> getAll() throws SQLException {
        List<Category> list = new ArrayList<Category>();

        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "select * from category";

        Connection connection;
        try {
            connection = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("catid");
                String name = rs.getString("catname");
                Category cat = new Category(id, name);
                list.add(cat);
            }

            if (connection != null) {
                connection.close();
                connection = null;
            }
        } catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return list;
    }

    public Clothes getProduct(int id) {
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "select * from product where id='" + id + "'";
        Clothes p = new Clothes();
        Connection con;
        try {
            con = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement ps = (PreparedStatement) con
                    .prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int _id = rs.getInt("id");
                String name = rs.getString("name");
                int price = rs.getInt("price");
                String describe = rs.getString("describe");
                int catid = rs.getInt("catid");
                int brand = rs.getInt("b_id");
                String picture = rs.getString("picture");
                p = new Clothes(_id, name, price, describe, catid, brand, picture);
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return p;
    }
    public List<Clothes> getMostBuy() throws SQLException {
        List<Clothes> list = new ArrayList<Clothes>();
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";

        String sql = "select  *, SUM(quantity) AS total from receiptdetail group by p_id  ORDER BY total desc limit 9";

        Connection connection;
        try {
            connection = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int price = rs.getInt("price");
                String describe = rs.getString("describe");
                int catid = rs.getInt("catid");
                int brand = rs.getInt("b_id");
                String picture = rs.getString("picture");
                Clothes cat = new Clothes(id, name, price, describe, catid, brand, picture);
                list.add(cat);
            }

            if (connection != null) {
                connection.close();
                connection = null;
            }
        } catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return list;

    }    public List<Clothes> getMostView() throws SQLException {
        List<Clothes> list = new ArrayList<Clothes>();
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        int p = 0;
        int p_one = 9;
        String sql = "select  * from product ORDER BY view DESC LIMIT 9";

        Connection connection;
        try {
            connection = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int price = rs.getInt("price");
                String describe = rs.getString("describe");
                int catid = rs.getInt("catid");
                int brand = rs.getInt("b_id");
                String picture = rs.getString("picture");
                Clothes cat = new Clothes(id, name, price, describe, catid, brand, picture);
                list.add(cat);
            }

            if (connection != null) {
                connection.close();
                connection = null;
            }
        } catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return list;

    }

public List<Clothes> getNewest()
{
        List<Clothes>list=new ArrayList<>();
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        Connection con;
       Statement pstmt=null;
        ResultSet rs=null;
        try
        {
            String  sql = "select * from product ORDER BY date desc limit 1";

            con=DriverManager.getConnection(connectionURL,dbUser,dbPassword);
            pstmt=con.createStatement();
            rs=pstmt.executeQuery(sql);
            while (rs.next())
            {
                Clothes c=new Clothes();
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                c.setPrice(rs.getInt(3));
                c.setDescribe(rs.getString(4));
                c.setCat(rs.getInt(5));
                c.setBrand(rs.getInt(6));
                c.setPicture(rs.getString(7));
                list.add(c);
            }

        }
        catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }

        return list;
    }
    public List<Clothes> getAllPaging(int page, int rowsPerPage) {
        List<Clothes>list=new ArrayList<>();
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        Connection con;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        try
        {

           String  sql = "select * from product ORDER BY date desc limit 3";

            con=DriverManager.getConnection(connectionURL,dbUser,dbPassword);
            pstmt=con.prepareStatement(sql);
            rs=pstmt.executeQuery();
            while (rs.next())
            {
                Clothes c=new Clothes();
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                c.setPrice(rs.getInt(3));
                c.setDescribe(rs.getString(4));
                c.setCat(rs.getInt(5));
                c.setBrand(rs.getInt(6));
                c.setPicture(rs.getString(7));
                list.add(c);
            }

        }
        catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }

        return list;
    }

    public List<Brand> getAllBrand()
    {
        List<Brand> list=new ArrayList<>();
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        Connection con;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        try
        {
            con=DriverManager.getConnection(connectionURL,dbUser,dbPassword);
            pstmt=con.prepareStatement("select *from brand");
            rs=pstmt.executeQuery();
            while (rs.next())
            {
                Brand c=new Brand();
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                list.add(c);
            }

        }
        catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }

        return list;
    }
    public List<Category> getAllCategory()
    {
        List<Category> list=new ArrayList<>();
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        Connection con;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        try
        {
            con=DriverManager.getConnection(connectionURL,dbUser,dbPassword);
            pstmt=con.prepareStatement("select *from category");
            rs=pstmt.executeQuery();
            while (rs.next())
            {
                Category c=new Category();
                c.setID(rs.getInt(1));
                c.setName(rs.getString(2));
                list.add(c);
            }

        }
        catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }

        return list;
    }
    public List<Clothes> getAllClothes()
    {
        List<Clothes>list=new ArrayList<>();
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        Connection con;
            PreparedStatement pstmt=null;
            ResultSet rs=null;
            try
            {
                con=DriverManager.getConnection(connectionURL,dbUser,dbPassword);
                pstmt=con.prepareStatement("select *from product");
                rs=pstmt.executeQuery();
                while (rs.next())
                {
                    Clothes c=new Clothes();
                    c.setId(rs.getInt(1));
                    c.setName(rs.getString(2));
                    c.setPrice(rs.getInt(3));
                    c.setDescribe(rs.getString(4));
                    c.setCat(rs.getInt(5));
                    c.setBrand(rs.getInt(6));
                    c.setPicture(rs.getString(7));
                    list.add(c);
                }

            }
            catch (SQLException sqle) {
                System.out.println("SQL Exception thrown: " + sqle);
            }

    return list;
        }
    public List<Clothes> viewAllClothes(int offset,int noOfRecords)
    {

        List<Clothes>list=new ArrayList<Clothes>();
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        Connection con;
        Statement pstmt;
        ResultSet rs=null;
        Clothes c=null;
        String query = "select SQL_CALC_FOUND_ROWS * from product limit "+ offset + ", " + noOfRecords;
        System.out.println("ClothesDao.viewAllClothes()"+query);
        try
        {
            con=DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            pstmt=con.createStatement();
            rs=pstmt.executeQuery(query);
            while (rs.next())
            {
               c =new Clothes();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setPrice(rs.getInt("price"));
                c.setDescribe(rs.getString("describe"));
                c.setCat(rs.getInt("catid"));
                c.setBrand(rs.getInt("b_id"));
                c.setPicture(rs.getString("picture"));
                list.add(c);
            }
            rs.close();
            rs=pstmt.executeQuery("SELECT FOUND_ROWS()");
            if(rs.next())
            {
                this.noOfRecords=rs.getInt(1);
            }
        }
        catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }

        return list;
    }

    public int getNoOfRecords() {
        return noOfRecords;
    }
    public List<Clothes>  getBrandByName(int id,int offset,int noOfRecords)
    {
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        List<Clothes> list = new ArrayList<Clothes>();
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        Connection con;
        String query = "select SQL_CALC_FOUND_ROWS * from product limit "+ offset + ", " + noOfRecords;
        System.out.println("ClothesDao.viewAllClothes()"+query);
        try {
            con = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            pstmt = con.prepareStatement("select  SQL_CALC_FOUND_ROWS *from product where b_id=? limit " + offset + ", " + noOfRecords);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
               int  _id = rs.getInt("id");
                String _name = rs.getString("name");
                int _price1 = rs.getInt("price");
                String describe = rs.getString("describe");
                int catid = rs.getInt("catid");
                int brand = rs.getInt("b_id");
                String picture = rs.getString("picture");
                Clothes cat = new Clothes(_id, _name, _price1, describe, catid, brand, picture);
                list.add(cat);
            }
            rs.close();
            rs=pstmt.executeQuery("SELECT FOUND_ROWS()");
            if(rs.next())
            {
                this.noOfRecords=rs.getInt(1);
            }
        }
        catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }

        return list;
}
        public List<Clothes> Search(String name, int offset, int noOfRecords)
        {
            String database = "clothingshop";
            String connectionURL = "jdbc:mysql://localhost:3306/" + database;
            String dbUser = "root";
            String dbPassword = "";
            List<Clothes> list = new ArrayList<Clothes>();
            PreparedStatement pstmt=null;
            ResultSet rs=null;
            Connection con;
            try {
                con = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
                pstmt = con.prepareStatement("select  SQL_CALC_FOUND_ROWS *from product where name like '%" + name +"%' limit " + offset + ", " + noOfRecords);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    int  _id = rs.getInt("id");
                    String _name = rs.getString("name");
                    int _price1 = rs.getInt("price");
                    String describe = rs.getString("describe");
                    int catid = rs.getInt("catid");
                    int brand = rs.getInt("b_id");
                    String picture = rs.getString("picture");
                    Clothes cat = new Clothes(_id, _name, _price1, describe, catid, brand, picture);
                    list.add(cat);
                }
                rs.close();
                rs=pstmt.executeQuery("SELECT FOUND_ROWS()");
                if(rs.next())
                {
                    this.noOfRecords=rs.getInt(1);
                }
            }
            catch (SQLException sqle) {
                System.out.println("SQL Exception thrown: " + sqle);
            }

            return list;
        }
    public List<Clothes> getCatByName(int id,int offset,int noOfRecords)
    {
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        List<Clothes> list = new ArrayList<Clothes>();
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        Connection con;

        try {
            con = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            pstmt = con.prepareStatement("select  SQL_CALC_FOUND_ROWS *from product where catid=? limit " + offset + ", " + noOfRecords);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                int  _id = rs.getInt("id");
                String _name = rs.getString("name");
                int _price1 = rs.getInt("price");
                String describe = rs.getString("describe");
                int catid = rs.getInt("catid");
                int brand = rs.getInt("b_id");
                String picture = rs.getString("picture");
                Clothes cat = new Clothes(_id, _name, _price1, describe, catid, brand, picture);
                list.add(cat);
            }
            rs.close();
            rs=pstmt.executeQuery("SELECT FOUND_ROWS()");
            if(rs.next())
            {
                this.noOfRecords=rs.getInt(1);
            }
        }
        catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }

        return list;
    }

    public ClothesCart getClothesByName2(int id)
    {
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        ClothesCart c=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        Connection con;

        try
        {
            con=DriverManager.getConnection(connectionURL,dbUser,dbPassword);
            pstmt=con.prepareStatement("select *from product where id=?");
            pstmt.setInt(1, id);
            rs=pstmt.executeQuery();
            if(rs.next())
            {
                c=new ClothesCart();
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                c.setPrice(rs.getInt(3));
                c.setCat(rs.getInt(5));
                c.setBrand(rs.getInt(6));
                c.setPicture(rs.getString(7));}

        }
        catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return c;

    }
    public Clothes getClothesByName(int id)
    {
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        Clothes c=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        Connection con;

        try
        {
            con=DriverManager.getConnection(connectionURL,dbUser,dbPassword);
            pstmt=con.prepareStatement("select *from product where id=?");
            pstmt.setInt(1, id);
            rs=pstmt.executeQuery();
            if(rs.next()) {
                c = new Clothes();
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                c.setPrice(rs.getInt(3));
                c.setDescribe(rs.getString(4));
                c.setCat(rs.getInt(5));
                c.setBrand(rs.getInt(6));
                c.setPicture(rs.getString(7));
                c.setView(rs.getInt(9));
            }
        }
        catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return c;

    }

    public List<Clothes> getList(String name, String _price, int clothescategories, int startIndex, int numberOfClothesPerpage){
        List<Clothes> list = new ArrayList<Clothes>();
        Connection con = null;
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sqlqueary = null;
        if ( !name.equals("") && clothescategories != 0  &&  !_price.equals("1") && !_price.equals("0")) {
            sqlqueary = "SELECT * from product  join brand on product.b_id=brand.b_id where brand.b_id='" + clothescategories + "' and name like '%" + name + "%' and price<27";
        }
        else if ( !(name.equals("")) && clothescategories != 0   && (_price.equals("2")) && !_price.equals("0")) {
            sqlqueary = "SELECT * from product  join brand on product.b_id=brand.b_id where brand.b_id='" + clothescategories + "' and name like '%" + name + "%' and price<50";
        } else if (  !(name.equals("")) &&clothescategories != 0  && (_price.equals("3")) && !_price.equals("0")) {
            sqlqueary = "SELECT * from product  join brand on product.b_id=brand.b_id where brand.b_id='" + clothescategories + "' and name like '%" + name + "%' price>30";
        }
        else if (!name.equals("") && clothescategories != 0 )
        {
            sqlqueary = "SELECT * from product  join brand on product.b_id=brand.b_id where brand.b_id='" + clothescategories + "' and name like '%" + name + "%'";
        }
        else if(clothescategories != 0 &&( _price.equals("1")) && !_price.equals("0"))
        {
            sqlqueary = "SELECT * from product  join brand on product.b_id=brand.b_id where brand.b_id='" + clothescategories + "' and price<27";
        }
        else if(clothescategories != 0&&( _price.equals("2")) && !_price.equals("0"))

        {
            sqlqueary = "SELECT * from product  join brand on product.b_id=brand.b_id where brand.b_id='" + clothescategories + "' and price<50";

        }
        else if(clothescategories != 0&&( _price.equals("3")) && !_price.equals("0"))
        {
            sqlqueary = "SELECT * from product  join brand on product.b_id=brand.b_id where brand.b_id='" + clothescategories + "' and price>30";

        }
        else if(!name.equals("")&&!_price.equals("")&&_price.equals("1") && !_price.equals("0"))
        {
            sqlqueary = "SELECT * from product where name like '%" + name + "%' and price<27";
        }

        else if(!name.equals("")&& !_price.equals("") && _price.equals("2") && !_price.equals("0"))
        {
            sqlqueary = "SELECT * from product where name like '%" + name + "%' and price<50";
        }

        else if(!name.equals("")&&!_price.equals("")&&_price.equals("3") && !_price.equals("0"))
        {
            sqlqueary = "SELECT * from product where name like '%" + name + "%' and price>30";
        }
        else if(clothescategories != 0)
        {
            sqlqueary = "SELECT * from product  join brand on product.b_id=brand.b_id where brand.b_id='" + clothescategories + "'";
        }
        else if ((!(name.equals(""))))
        {
            sqlqueary="select *from product where name like '%" + name + "%'";
        }
        else if(_price.equals("1") && !_price.equals("0"))
        {
            sqlqueary = "SELECT * from product where  price<27";

        }
        else if((_price.equals("2")) && !_price.equals("0"))
        {
            sqlqueary = "SELECT * from product where  price<50";

        }
        else if((_price.equals("3")) && !_price.equals("0"))
        {
            sqlqueary = "SELECT * from product where  price>30";

        }
else
        {
            sqlqueary="select *from product ";
        }
        try{
            con = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            try{
                if(sqlqueary!=null || sqlqueary!=""){
                    sqlqueary = sqlqueary +" "+ "limit "+startIndex+","+ numberOfClothesPerpage +"";
                }
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sqlqueary);
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String _name = rs.getString("name");
                    int _price1 = rs.getInt("price");
                    String describe = rs.getString("describe");
                    int catid = rs.getInt("catid");
                    int brand = rs.getInt("b_id");
                    String picture = rs.getString("picture");
                    Clothes cat = new Clothes(id, _name, _price1, describe, catid, brand, picture);
                    list.add(cat);
                }
            }catch (SQLException s){
                System.out.println("SQL statement is not executed!");
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public boolean update(int id,String name,int price, String describe,String picture)
    {
        boolean success = false;
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        Connection connection;

        String sqlqueary = "update product set name = ?, price = ?,`describe` = ?,  picture =? where id=?";


        try{
            connection = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement update = connection.prepareStatement(sqlqueary);
            update.setString(1, name);
            update.setInt(2, price);
            update.setString(3, describe);
            update.setString(4,picture);
            update.setInt(5, id);
            int i = update.executeUpdate();
            success = (i==1);
        }
        catch (SQLException sqle) {

          System.out.println("SQL Exception thrown: " + sqle);
        }
        return success;
    }
    public boolean updateView(Clothes c,int id)
    {
        boolean success = false;
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        Connection connection;
        ResultSet rs=null;

        String sqlqueary = "update product set view=? where id=?";


        try{
            connection = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement update = connection.prepareStatement(sqlqueary);
            update.setInt(1,c.getView());
            update.setInt(2,id);
            int i = update.executeUpdate();
            success = (i==1);
        }
        catch (SQLException sqle) {

            System.out.println("SQL Exception thrown: " + sqle);
        }
        return success;
    }
    public boolean update2(int id,String name,int price, String describe)
    {
        boolean success = false;
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        Connection connection;

        String sqlqueary = "update product set name = ?, price = ?,`describe` = ? where id=?";


        try{
            connection = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement update = connection.prepareStatement(sqlqueary);
            update.setString(1, name);
            update.setInt(2, price);
            update.setString(3, describe);
            update.setInt(4, id);
            int i = update.executeUpdate();
            success = (i==1);
        }
        catch (SQLException sqle) {

            System.out.println("SQL Exception thrown: " + sqle);
        }
        return success;
    }
}
