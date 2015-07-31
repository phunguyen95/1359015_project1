package servlet;
import com.mypackage.ClothesDao;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
        maxFileSize=1024*1024*10,      // 10MB
        maxRequestSize=1024*1024*50)

public class UpdateProduct extends HttpServlet {
    private static final String SAVE_DIR="Users";
    private static final String SAVE_DIR2="13590_000";
    private static final String SAVE_DIR3="IdeaProjects";
    private static final String SAVE_DIR4="1359015_project1";
    private static final String SAVE_DIR5="web";
    private static final String SAVE_DIR6="img";



    static{
        try{
            //loads com.mysql.jdbc.Driver into memory
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch(ClassNotFoundException cnf){
            System.out.println("Driver could not be loaded" + cnf);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Part part = request.getPart("picture");
        String fileName = extractFileName(part);
        if (!fileName.equals(""))
        {
            String savePath = "C:" + File.separator + SAVE_DIR + File.separator + SAVE_DIR2 + File.separator + SAVE_DIR3 + File.separator + SAVE_DIR4 + File.separator + SAVE_DIR5 + File.separator + SAVE_DIR6;
            File fileSaveDir = new File(savePath);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdir();
            }

            part.write(savePath + File.separator + fileName);
            int _masp = 0;
            String masp = request.getParameter("masp");
            if (masp != null) {
                _masp = Integer.parseInt(masp);
            }
            String name = "";
            if (request.getParameter("name") != null) {
                name = request.getParameter("name");
            }
            String price = "";
            int _price = 0;
            if (request.getParameter("price") != null) {
                price = request.getParameter("price");
                _price = Integer.parseInt(price);
            }
            String describe = "";
            if (request.getParameter("detail") != null) {
                describe = request.getParameter("detail");
            }
            ClothesDao clo = new ClothesDao();
            clo.update(_masp, name, _price, describe, fileName);
            response.sendRedirect("removeband.jsp");
        }
        else if (fileName.equals(""))
        {
            int _masp = 0;
            String masp = request.getParameter("masp");
            if (masp != null) {
                _masp = Integer.parseInt(masp);
            }
            String name = "";
            if (request.getParameter("name") != null) {
                name = request.getParameter("name");
            }
            String price = "";
            int _price = 0;
            if (request.getParameter("price") != null) {
                price = request.getParameter("price");
                _price = Integer.parseInt(price);
            }
            String describe = "";
            if (request.getParameter("detail") != null) {
                describe = request.getParameter("detail");
            }
            ClothesDao clo = new ClothesDao();
            clo.update2(_masp, name, _price, describe);
            response.sendRedirect("removeband.jsp");
        }
    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
}