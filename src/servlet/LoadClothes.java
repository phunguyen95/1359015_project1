package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import com.mypackage.Clothes;
import com.mypackage.ClothesDao;

/**
 * Created by 13590_000 on 5/27/2015.
 */
@WebServlet(name="LoadClothes")
@SuppressWarnings("unchecked")
public class LoadClothes extends HttpServlet {
        protected void doGet (HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
            List<Clothes> list = new ClothesDao().getAllClothes();
            request.setAttribute("listclothes", list);
            HttpSession session = request.getSession();
            session.setAttribute("listclothes",list);
            HashMap<Integer, Integer> fBuy = (HashMap<Integer, Integer>) session.getAttribute("listBuy");
            if (fBuy != null) {
                session.setAttribute("total", fBuy.size());
            } else {
                session.setAttribute("total", "0");
            }
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }
        /*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            List<Clothes> list = new ClothesDao().getAllClothes();
            request.setAttribute("listclothes",list);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }*/
    }