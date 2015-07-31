package controller;

/**
 * Created by 13590_000 on 5/30/2015.
 */
public class ClothesCart {
    private int _id;
    private String _name;
    private int _price;
    private int _catid;
    private int _brand;
    private int total;
    private String _picture;
    private float totalPaid;
    private long tongtien;
    public ClothesCart()
    {

    }
    public ClothesCart(int _id,String _name,int _price,int _catid,int _brand,int total,float totalPaid,String _picture)
    {
        this._id=_id;
        this._name=_name;
        this._price=_price;
        this._brand=_brand;
        this._catid=_catid;
        this.total=total;
        this.totalPaid=totalPaid;
        this._picture=_picture;
    }
    public ClothesCart(int id,String name,String picture,int _price)
    {
      this._id=id;
        this._name=name;
        this._picture=picture;
        this._price=_price;
    }
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
    public int getTotal() {
        return total;
    }
    public void setTotal(int value)
    {
     total=value;
    }
    public float getTotalPaid()
    {
        return totalPaid;
    }
    public void setTotalPaid(float value)
    {
        totalPaid=value;
    }
    public long getTongtien(){ return tongtien;}
    public void setTongtien(long value){tongtien = value;}
    public String getPicture()
    {
        return _picture;
    }
    public void setPicture(String value)
    {
        _picture=value;
    }
}
