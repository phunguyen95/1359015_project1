package com.mypackage;

import java.sql.*;
import java.util.Date;
 import java.util.*;

/**
 * Created by 13590_000 on 6/2/2015.
 */
public class Recipe {
    static{
        try{
            //loads com.mysql.jdbc.Driver into memory
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch(ClassNotFoundException cnf){
            System.out.println("Driver could not be loaded" + cnf);
        }
    }
    public int id;
    private String user;
    private String name;
   float price;
    private int status;
    private Date date;
    private Date datestatus;
  float total;
    public  int p_id;
    public int quantity;
    private String address;
    private String telephone;
    public Recipe()
    {

    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public int getId()
    {
        return id;
    }
    public int getP_id()
    {
        return p_id;
    }
    public void setP_id(int value)
    {
        p_id=value;
    }
    public int getQuantity()
    {
        return  quantity;
    }
    public void setQuantity(int value)
    {
        quantity=value;
    }
public float getTotal()
{
    return  total;
}
    public void setTotal(float value)
    {
        total=value;
    }
    public void setId(int value)
    {
        id=value;
    }
    public String getName()
    {
        return name;
    }
    public void setName(String value)
    {
        name=value;
    }
    public String getUser()
    {
        return user;
    }
    public void setUser(String value)
    {
        user=value;
    }
    public float getPrice()
    {
        return price;
    }
    public void setPrice(float value)
    {
        price=value;
    }
    public int getStatus()
    {
        return status;
    }
    public void setStatus(int value)
    {
        status=value;
    }
    public Date getDate()
    {
        return date;
    }
    public void setDate(Date value)
    {
        date=value;
    }
    public Date getDatestatus()
    {
        return datestatus;
    }
    public void setDatestatus(Date value)
    {
        datestatus=value;
    }
    public Recipe(int _id,String _user,String _name,float _price,int _status,Date _date,Date _datestatus,String _telephone,String _address)
    {
        this.id=_id;
        this.user=_user;
        this.name=_name;
        this.price=_price;
        this.status=_status;
        this.date=_date;
        this.datestatus=_datestatus;
        this.telephone=_telephone;
        this.address=_address;
    }
    public Recipe(int _id,int p_id,String _name,int _price,int quantiy,float total)
    {
        this.id=_id;
        this.p_id=p_id;
        this.name=_name;
        this.price=_price;
        this.total=total;
        this.quantity=quantiy;
    }
    public void updaterecipe(int recipeid, int _status, Date _date){
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "update recipe set status = ?, datestatus = ? where id = ?";
        Clothes p = new Clothes();
        Connection con;
        try {
            con = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,_status);
            ps.setDate(2,(java.sql.Date) _date);
            ps.setInt(3,recipeid);
            ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
