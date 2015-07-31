package com.mypackage;

/**
 * Created by 13590_000 on 6/12/2015.
 */
public class Brand {
    private int _brandid;
    private String _name;
    public int getId(){return _brandid;}
    public void setId(int value){_brandid = value;}
    public String getName(){return _name;}
    public void setName(String value){_name = value;}
    public Brand()
    {

    }

    public Brand(int id,String name)
    {
        _brandid=id;
        _name=name;
    }
}
