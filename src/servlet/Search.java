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
import java.util.List;

/**
 * Created by 13590_000 on 6/25/2015.
 */
@WebServlet(name = "Search")
public class Search extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int d = 1;
        int recordsPerPage = 9;
        if (request.getParameter("d") != null) {
            d = Integer.parseInt(request.getParameter("d"));
        }
        ClothesDao dao = new ClothesDao();
        List<Clothes> search = dao.Search(name, (d - 1) * recordsPerPage, recordsPerPage);
        int noOfRecords = dao.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
        HttpSession session = request.getSession();
        session.setAttribute("search", search);
        session.setAttribute("noOfPages", noOfPages);
        session.setAttribute("currentPage", d);
        session.setAttribute("i", name);
        request.getRequestDispatcher("searchresult2.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doPost(request,response);
    }
}