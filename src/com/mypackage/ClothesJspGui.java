package com.mypackage;

/**
 * Created by 13590_000 on 5/19/2015.
 */
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 13590_000 on 5/19/2015.
 */
public class ClothesJspGui {




    /**
     * Created by ADMIN on 5/11/2015.
     */
    public static String ToString(List<Category> list){
        StringBuilder sb= new StringBuilder();
        for(Category cloth : list){
            sb.append("ID=" + cloth.getID() + "\tName="+cloth.getName()+"<br/>");
        }
        return sb.toString();
    }
    public static String view(List<Clothes> list){
        StringBuilder sb= new StringBuilder();
        for(Clothes cloth : list){
            sb.append("ID=" + cloth.getId() + "<br/>" + "\tName=" + cloth.getName() + "<br/>" + "\t Price=" + cloth.getPrice() + "<br/>" + "\t Describe=" + cloth.getDescribe() + "<br/>" + "Cat ID=" + cloth.getCat() + "'<br/>" + "Brand=" + cloth.getBrand() + "<br/>"+"<img src='..\\img\\"+cloth.getPicture()+"'\"<br/>" + "<a href='GioHangServlet?command=addCart&id="+cloth.getId()+"'><img src='..\\img\\icon-cart.png'/></a><br/>");
        }
        return sb.toString();
    }

}
