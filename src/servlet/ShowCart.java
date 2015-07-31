package servlet;

import com.mypackage.Clothes;
import com.mypackage.ClothesDao;
import controller.ClothesCart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

/**
 * Created by 13590_000 on 5/30/2015.
 */
@WebServlet(name = "ShowCart")
public class ShowCart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        HashMap<Integer, Integer> fBuy = (HashMap<Integer, Integer>) session.getAttribute("listBuy");
        if(fBuy!=null) {
            List<ClothesCart> listCartView =new ArrayList<ClothesCart>();
            Set<Integer> listKey = fBuy.keySet();
            Iterator<Integer> it = listKey.iterator();
            ClothesDao objDao=new ClothesDao();
            float total=0;
            while (it.hasNext()) {
                int id=it.next();
                Clothes c=objDao.getClothesByName(id);
                ClothesCart clothView=new ClothesCart();
                clothView.setId(c.getId());
                clothView.setName(c.getName());
                clothView.setBrand(c.getBrand());
                clothView.setCat(c.getCat());
                clothView.setPrice(c.getPrice());
                clothView.setTotal(fBuy.get(id));
                clothView.setTotalPaid(clothView.getPrice()*clothView.getTotal());
                total+=clothView.getTotalPaid();
                listCartView.add(clothView);
            }
            session.setAttribute("total",total);
            session.setAttribute("list",listCartView);
            request.getRequestDispatcher("test2.jsp").forward(request,response);
        }
        else
        {
            request.getRequestDispatcher("Men.jsp").forward(request,response);
        }
    }
}
