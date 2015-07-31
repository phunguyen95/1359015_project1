package servlet;

import com.mypackage.Clothes;
import com.mypackage.ClothesDao;

    import javax.servlet.ServletException;
    import javax.servlet.annotation.WebServlet;
    import javax.servlet.http.HttpServlet;
    import javax.servlet.http.HttpServletRequest;
    import javax.servlet.http.HttpServletResponse;
    import javax.servlet.http.HttpSession;
    import java.io.IOException;
    import java.util.HashMap;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

/**
 * Created by 13590_000 on 5/27/2015.
 */
@WebServlet(name = "BuyCloth",urlPatterns = {"/BuyCloth"})
public class BuyCloth extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String a = request.getParameter("name");
        int id=Integer.parseInt(a);
        Clothes c = new ClothesDao().getClothesByName(id);
        request.setAttribute("clothes", c);
        request.getRequestDispatcher("chooseTotalToBuy.jsp").forward(request, response);
    }

}