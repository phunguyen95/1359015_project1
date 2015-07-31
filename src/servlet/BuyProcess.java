package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

/**
 * Created by 13590_000 on 5/28/2015.
 */
@WebServlet(name = "BuyProcess",urlPatterns = {"/BuyProcess"})
@SuppressWarnings("unchecked")
public class BuyProcess extends HttpServlet {

    protected void doGet (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        int id=0;

        if(request.getParameter("name")!=null){
            id = Integer.parseInt(request.getParameter("name"));
        }

        int numberOfClothes = 1;
        if(request.getParameter("number")!=null){
            numberOfClothes=Integer.parseInt(request.getParameter("number"));
        }
        HashMap<Integer,Integer> fBuy = (HashMap<Integer,Integer>) session.getAttribute("listBuy");
        if (fBuy == null) {

            fBuy = new HashMap<>();
            fBuy.put(id, numberOfClothes);
            numberOfClothes++;
            System.out.println("Da them 1 san pham");


        } else {
            Set<Integer> IsName = fBuy.keySet();
            boolean b1=false;
            Iterator<Integer> it = IsName.iterator();
            int isbnChoosed=0;
            while (it.hasNext()) {
                isbnChoosed =it.next();

                if (isbnChoosed==id) {
                    System.out.println("Da tim thay");
                    int numberChoosed = fBuy.get(isbnChoosed) + numberOfClothes;
                    fBuy.remove(isbnChoosed);
                    fBuy.put(isbnChoosed, numberChoosed);

                    System.out.println("Da mua them ");
                    b1=true;
                    break;
                }
            }
            if(!b1)
            {
                fBuy.put(id, numberOfClothes);
                numberOfClothes++;
                System.out.println("Da tim thay");
                System.out.println("Da mua them ");
            }
        }
        session.setAttribute("listBuy", fBuy);
        request.getRequestDispatcher("Men.jsp").forward(request, response);
    }

}
