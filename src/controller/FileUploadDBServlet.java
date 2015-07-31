package controller;
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

public class FileUploadDBServlet extends HttpServlet {
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
        HttpSession session=request.getSession();
        PrintWriter out = response.getWriter();
        String savePath = "C:" + File.separator + SAVE_DIR + File.separator + SAVE_DIR2 + File.separator + SAVE_DIR3 + File.separator + SAVE_DIR4 + File.separator + SAVE_DIR5 + File.separator +SAVE_DIR6;
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }

        String name=request.getParameter("name");
        String price="";
        int _price=0;
        if(request.getParameter("price")!=null)
        {
            price=request.getParameter("price");
            _price=Integer.parseInt(price);
        }
        String describe="";
        if(request.getParameter("describe")!=null)
        {
            describe=request.getParameter("describe");
        }
        String cat="";
        int _cat=0;
        if(request.getParameter("cat")!=null)
        {
           cat=request.getParameter("cat");
            _cat=Integer.parseInt(cat);
        }
        String brand="";
        int _brand=0;
        if(request.getParameter("brand")!=null) {
            brand = request.getParameter("brand");
            _brand = Integer.parseInt(brand);
        }
        Part part = request.getPart("picture");
        String fileName = extractFileName(part);
        part.write(savePath + File.separator + fileName);
        String database = "clothingshop";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        Connection connection;
        try {

            connection = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            String query = "INSERT INTO product (name,price,`describe`, picture,catid,b_id,date) values (?, ?, ?,?,?,?, NOW())";

            PreparedStatement pst;
            pst = connection.prepareStatement(query);
            pst.setString(1, name);

            pst.setInt(2, _price);
            pst.setString(3, describe);

            String filePath = savePath + File.separator + fileName;
            pst.setString(4, fileName);
            pst.setInt(5, _cat);
            pst.setInt(6, _brand);
            session.setAttribute("name",name);
            session.setAttribute("price",_price);
            session.setAttribute("description",describe);
            session.setAttribute("file",fileName);
            session.setAttribute("catid",_cat);
            session.setAttribute("brand",_brand);
            pst.executeUpdate();
            String a="Sucessfull";
            session.setAttribute("insert",a);
        } catch (SQLException sqle) {
            out.println("SQL Exception thrown: " + sqle);
        }
        response.sendRedirect("insert.jsp");
    }
    // file name of the upload file is included in content-disposition header like this:
    //form-data; name="dataFile"; filename="PHOTO.JPG"
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