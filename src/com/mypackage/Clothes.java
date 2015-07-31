package com.mypackage;
import java.io.Serializable;

/**
 * Created by 13590_000 on 5/19/2015.
 */
import java.sql.*;
import java.util.Date;
/**
 * Created by 13590_000 on 5/19/2015.
 */
public class Clothes {
    static {
        try {
            //loads com.mysql.jdbc.Driver into memory
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException cnf) {
            System.out.println("Driver could not be loaded" + cnf);
        }
    }
    private static final long serialVersionUID = -822312181022679845L;

    private int _id;
    private String _name;
    private int _price;
    private   String _describe;
    private String _picture;
    Date _date;
    int _catid;
    int _brand;

    public int getView() {
        return view;
    }

    public void setView(int view) {
        this.view = view;
    }

    int view;
    public int getId() {
        return _id;
    }

    public void setId(int value) {
        _id =value;
    }

    public String getName() {
        return _name;
    }

    public void setName(String value) {
        _name = value;
    }

    public int getPrice() {
        return _price;
    }

    public void setPrice(int value)
    {
        _price=value;
    }
    public int getCat() {
        return _catid;
    }
    public void setCat(int value)
    {
        _catid=value;
    }
    public int getBrand() {
        return _brand;
    }
    public void setBrand(int value)
    {
        _brand=value;
    }
    public String getPicture()
    {
        return _picture;
    }
    public void setPicture(String value)
    {
        _picture=value;
    }
    public String getDescribe()
    {
        return _describe;
    }
    public void setDescribe(String value)
    {
        _describe=value;
    }
  public   Clothes() {
    }
    public Clothes(int _id,String _name,int _price,String _describe,int _catid,int _brand,String _picture)
    {

        this._id=_id;
        this._name=_name;
        this._price=_price;
        this._describe=_describe;
        this._catid=_catid;
        this._brand=_brand;
        this._picture=_picture;
    }

    public Clothes getProduct(Clothes c) {
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "select * from product where name=?";
        Connection conn;
        try {
            conn= DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1,c._name);
            ResultSet rs = psmt.executeQuery();
            if (rs.next()) {
               c._id = rs.getInt("id");
                c._name = rs.getString("name");
                c._price = rs.getInt("price");
                c._describe = rs.getString("describe");
                 c._catid = rs.getInt("catid");
                c._brand = rs.getInt("b_id");
                c._picture = rs.getString("picture");

            }
            if(conn!=null) {
                conn.close();
                conn = null;
            }
        } catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return c;
    }
}