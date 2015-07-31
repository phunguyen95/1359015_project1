package servlet;

import com.mypackage.Clothes;
import com.mypackage.ClothesDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by 13590_000 on 6/11/2015.
 */
@WebServlet(name = "GetID",urlPatterns = {"/GetId"})
public class GetId extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ClothesDao clothesDao = new ClothesDao();
        Clothes c=new Clothes();
        String a = request.getParameter("name");
        int id=Integer.parseInt(a);
        c=clothesDao.getClothesByName(id) ;
        System.out.print(c.getView());
        c.setView(c.getView()+1);
        System.out.print(c.getView());
        if(clothesDao.updateView(c,id)){
            System.out.print("View updated successful");
        }
        else {
            System.out.print("View updated unsuccessful");
        }
        request.setAttribute("detail", c);
        request.getRequestDispatcher("details.jsp").forward(request, response);
    }
}
