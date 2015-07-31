package com.mypackage;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.mypackage.Clothes;
import com.mypackage.ClothesDao;
/**
 * Created by 13590_000 on 5/24/2015.
 */
/**
 * @author Vinay Singh Rawat Servlet implementation class
 *         Servlet->This servlet is the implementation of pagination.
 */
public class Servlet  extends HttpServlet {
    private static final long serialVersionUID = -9219651106472679495L;
    private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    private final  String database = "clothingshop";
    private final String connectionURL = "jdbc:mysql://localhost:3306/" + database;
    private final String dbUser = "root";
    private final String dbPassword = "";
    private Connection conn = null;
    private Statement stmt = null;
    private List<Clothes> list ;
    private HttpSession session;
    public final int perPagesArticles = 6;
    private List<Cart> cart = new ArrayList<Cart>();

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     * @RequestParameters action (load,next,previous)
     * @Description load-load the list and display first page. next-is for next
     *              page to display previous- is for previous page to display
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("displayPaging.jsp").forward(request, response);

    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     * @RequestParameters action (load,next,previous)
     * @Description load-load the list and display first page. next-is for next
     *              page to display previous- is for previous page to display
     */
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String name = null;
        if(request.getParameter("name")!=null){
            name=request.getParameter("name");
        }

        session = request.getSession();
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
            list = getList(0, perPagesArticles);
            session.setAttribute("list", list);
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
            else if(action!=null && action.equals(name)){
                Clothes cloth = new Clothes();
            cloth.setName(name);
            Clothes a = new Clothes();
            a.getProduct(cloth);
            addToCart(cloth);
            session = request.getSession();
            System.out.println(cart.size());
            session.setAttribute("cart",cart);
        }

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
            session.setAttribute("btnPrevious", "Previous");
            session.setAttribute("startIndex",
                    (Integer) session.getAttribute("startIndex")
                            + perPagesArticles);
            list = getList((Integer) session.getAttribute("startIndex"),
                    perPagesArticles);
            // Calculating and setting page number
            int startIndex = (Integer) session.getAttribute("startIndex");
            int pageNumber = startIndex / perPagesArticles;
            session.setAttribute("pageNumber", ++pageNumber);
            // Set list in session to display in page
            session.setAttribute("list", list);
            int size1 = getList(
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
            session.setAttribute("btnNext", "Next");
            session.setAttribute("startIndex",
                    (Integer) session.getAttribute("startIndex")
                            - perPagesArticles);
            list = getList((Integer) session.getAttribute("startIndex"),
                    perPagesArticles);
            // Calculating and setting page number
            int startIndex = (Integer) session.getAttribute("startIndex");
            int pageNumber = startIndex / perPagesArticles;
            session.setAttribute("pageNumber", ++pageNumber);
            // Set list in session to display in page
            session.setAttribute("list", list);
            // logic to disable Previous button.
            if ((Integer) session.getAttribute("startIndex") <= 0) {
                session.setAttribute("btnPrevious", "Previous Disabled");
                session.setAttribute("btnNext", "Next");
                session.setAttribute("startIndex", 0);
            } else {
                session.setAttribute("btnNext", "Next");
            }
        }
        request.getRequestDispatcher("displayPaging.jsp").forward(request, response);
    }

    /**
     * @return List<Clothes>
     * @Description This method will fetch the list of Clothes from data base
     *              with given limit of number of perPagesArticles.
     */


    private List<Clothes> getList(int startIndex, int numberOfClothesPerpage) {
        List<Clothes> list = new ArrayList<Clothes>();
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";

        try {
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            stmt = conn.createStatement();
            String sql;
            sql = "SELECT * FROM product LIMIT " + startIndex + ","
                    + numberOfClothesPerpage;
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                int _id = rs.getInt("id");
                String _name = rs.getString("name");
                int _price = rs.getInt("price");
                String _describe = rs.getString("describe");
                int _catid = rs.getInt("catid");
                int _brand = rs.getInt("b_id");
               String _picture = rs.getString("picture");
                Clothes cat = new Clothes(_id, _name, _price, _describe, _catid, _brand, _picture);
                list.add(cat);
            }
        }
        catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null)
                    stmt.close();
            } catch (SQLException se2) {
            }
            try {
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
        return list;
    }

    public String addToCart(Clothes cloth) {
        int count = 0;
        for (Cart item : cart) {
            if (item.getP().getId()== cloth.getId()) {
                System.out.println("<script>alert('Da cong 1')</script>");
                item.setQuantity(item.getQuantity() + 1);
                count++;
            }
        }
        if(count==0) {
            Cart c = new Cart();
            c.setP(cloth);
            c.setQuantity(1);
            cart.add(c);
        }
        return "cart";
    }

}