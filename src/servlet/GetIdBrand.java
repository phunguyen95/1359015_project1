package servlet;

import com.mypackage.Brand;
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
 * Created by 13590_000 on 6/11/2015.
 */
@WebServlet(name = "GetIdBrand",urlPatterns = {"/GetIdBrand"})
public class GetIdBrand extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String a = request.getParameter("name");

        int id=Integer.parseInt(a);
        int d=1;
        int recordsPerPage = 4;
        if(request.getParameter("d") != null){
            d = Integer.parseInt(request.getParameter("d"));
        }
        ClothesDao dao = new ClothesDao();
        List<Clothes> c = dao.getBrandByName(id,(d - 1) * recordsPerPage, recordsPerPage);

        int noOfRecords = dao.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
        HttpSession session=request.getSession();
        session.setAttribute("trend",c);
        session.setAttribute("noOfPages", noOfPages);
        session.setAttribute("currentPage", d);
        session.setAttribute("i",id);
        request.getRequestDispatcher("brand.jsp").forward(request, response);
    }
}
