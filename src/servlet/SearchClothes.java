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
 * Created by 13590_000 on 6/8/2015.
 */
public class SearchClothes extends javax.servlet.http.HttpServlet {
    private HttpSession session;
    private List<Clothes> list;
    private int perPagesArticles = 6;
    static{
        try{
            //loads com.mysql.jdbc.Driver into memory
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch(ClassNotFoundException cnf){
            System.out.println("Driver could not be loaded" + cnf);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException,IOException {
        response.setContentType("text/html");
        session = request.getSession();
        String action = request.getParameter("action");

        String _name = "";
        if(request.getParameter("txtname")!=null){
            _name = request.getParameter("txtname");
            session.setAttribute("txtname",_name);
        }
        else if(session.getAttribute("txtname")!=null){
            _name= (String) session.getAttribute("txtname");
        }
        String _price ="";
        if(request.getParameter("txtprice")!=null){
            _price = request.getParameter("txtprice");
            session.setAttribute("txtprice",_price);
        }
        else if(session.getAttribute("txtprice")!=null){
            _price= (String) session.getAttribute("txtprice");
        }
        String _category = "";
        int cate = 0;
        if(request.getParameter("txtcategory")!=null){
            _category = request.getParameter("txtcategory");
            cate = Integer.parseInt(_category);
            session.setAttribute("txtcategory",_category);
        }
        else if(session.getAttribute("txtcategory")!=null){
            _category= (String) session.getAttribute("txtcategory");
            cate = Integer.parseInt(_category);
        }
        session = request.getSession();
        ClothesDao clo = new ClothesDao();
        // load first page of list to display.
        if (action!=null&&action.equals("load")) {
            // Get the list
            // list = prepareList();
            session = request.getSession();
			/*
			 * Have to set some variables in session for pagination.
			 *
			 * @pageNumber will use to display the current page number.
			 *
			 * @list is the list of Clothes which will be displayed in page.
			 *
			 * @startIndex is the index of database from where the list will be
			 * start.
			 *
			 * @perPagesArticles is maximum number of Clothes to
			 * be fetched from database.
			 *
			 * @btnNext is for next button
			 *
			 * @btnPrevious is for previous button.
			 */
            session.setAttribute("pageNumber", 1);

            list = clo.getList(_name,_price,cate,0,perPagesArticles);
            session.setAttribute("listsearch", list);
            session.setAttribute("startIndex", 0);
            session.setAttribute("btnNext", "Next");
            session.setAttribute("btnPrevious", "Previous Disabled");
            if (list!=null&&list.size() < perPagesArticles
                    || list.size() == 0) {
                session.setAttribute("btnNext", "");
                session.setAttribute("btnPrevious", "");
            }


        }

        //Cart
        /*else if(action!=null && action.equals(name)){
            Clothes cloth = new Clothes();
            cloth.setName(name);
            Clothes a = new Clothes();
            a.getProduct(cloth);
            addToCart(cloth);
            session = request.getSession();
            System.out.println(cart.size());
            session.setAttribute("cart",cart);
        }*/

        // next-is for next page to display
        else if (action!=null&&action.equals("next")) {

			/*
			 * Have to set some variables in session for pagination.
			 *
			 * @pageNumber will use to display the current page number.
			 *
			 * @list is the list of Clothes which will be displayed in page.
			 *
			 * @startIndex is the index of database from where the list will be
			 * start.
			 *
			 * @perPagesArticles is maximum number of Clothes to
			 * be fetched from database.
			 *
			 * @btnNext is for next button @btnPrevious is for previous button.
			 */
            session = request.getSession();
            session.setAttribute("btnPrevious", "Previous");
            session.setAttribute("startIndex",
                    (Integer) session.getAttribute("startIndex")
                            + perPagesArticles);
            list = clo.getList(_name, _price, cate, (Integer) session.getAttribute("startIndex"),
                    perPagesArticles);
            // Calculating and setting page number
            int startIndex = (Integer) session.getAttribute("startIndex");
            int pageNumber = startIndex / perPagesArticles;
            session.setAttribute("pageNumber", ++pageNumber);
            // Set list in session to display in page
            session.setAttribute("listsearch", list);
            int size1 = clo.getList(_name, _price, cate,
                    (Integer) session.getAttribute("startIndex")
                            + perPagesArticles,
                    perPagesArticles).size();
            // logic to disable Next button.
            if (list!=null&&list.size() < perPagesArticles || size1 == 0) {
                session.setAttribute("btnNext", "Next Disabled");
                session.setAttribute("btnPrevious", "Previous");
            }
        }
        // previous- is for previous page to display
        else if (action!=null&&action.equals("previous")) {
			/*
			 * Have to set some variables in session for pagination.
			 *
			 * @pageNumber will use to display the current page number.
			 *
			 * @list is the list of Clothes which will be displayed in page.
			 *
			 * @startIndex is the index of database from where the list will be
			 * start.
			 *
			 * @perPagesArticles is maximum number of Clothes to
			 * be fetched from database.
			 *
			 * @btnNext is for next button
			 *
			 * @btnPrevious is for previous button.
			 */
            session = request.getSession();
            session.setAttribute("btnNext", "Next");
            session.setAttribute("startIndex",
                    (Integer) session.getAttribute("startIndex")
                            - perPagesArticles);
            list = clo.getList(_name, _price, cate, (Integer) session.getAttribute("startIndex"),
                    perPagesArticles);
            // Calculating and setting page number
            int startIndex = (Integer) session.getAttribute("startIndex");
            int pageNumber = startIndex / perPagesArticles;
            session.setAttribute("pageNumber", ++pageNumber);
            // Set list in session to display in page
            session.setAttribute("listsearch", list);
            // logic to disable Previous button.
            if ((Integer) session.getAttribute("startIndex") <= 0) {
                session.setAttribute("btnPrevious", "Previous Disabled");
                session.setAttribute("btnNext", "Next");
                session.setAttribute("startIndex", 0);
            } else {
                session.setAttribute("btnNext", "Next");
            }
        }
        RequestDispatcher rd = request.getRequestDispatcher("searchresult.jsp");
        rd.forward(request,response);
    }

}