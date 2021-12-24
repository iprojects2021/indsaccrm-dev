package blezz;


import java.io.*;
import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Properties;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/fileUpload")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 5, // 5 MB
        maxRequestSize = 1024 * 1024 * 10)
// 10 MB
public class FileUploadController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        //String root = (String) session.getAttribute("root");
        
        String usercid_adminid=(String)session.getAttribute("usercid_adminid");
        String root = Poul.getDirPath();
       System.out.print("File Upload Servlet,root="+root);
        File file = new File(root);
        //String parentPath = file.getAbsoluteFile().getParent();
        //  System.out.print("File Upload Servlet, new File(parentPath)1parentpath="+parentPath);
        file = new File(root);
       //  parentPath = file.getAbsoluteFile().getParent();
       //  System.out.print("File Upload Servlet getAbsoluteFile(),2parentpath="+parentPath);
       //  parentPath=parentPath+  File.separator +"logoupload";
     //   System.out.println("3parentpath="+parentPath);
       //production path
      //  root=parentPath;
         System.out.println("46root"+root);
        Part part = request.getPart("blob");
        String fileName = null;
        String message = null;
        
        if (part != null) {
            //writing blob
            fileName = request.getParameter("blobName");
            String fileDir = root  +File.separator +fileName;
            request.setAttribute("fileName", fileName);
            System.out.println("fileName"+fileName);
            part.write(root + File.separator + fileName);
            message = fileName + " was uploaded successfully";
            request.setAttribute("message", message);
            try{
                    Connection con=Poul.getConnectionCRM();
                    PreparedStatement smt=con.prepareStatement("update register set logo = ? where useradminid = ? ");
                    smt.setString(1,fileName);
                    smt.setString(2,usercid_adminid);
                    int fi=smt.executeUpdate();
            
                    smt.close();
                    con.close();  
                }
                catch(Exception e){
                     e.printStackTrace();
                }
                  
              
        }
        else
        {
             message = " File was not uploaded successfully";
            request.setAttribute("message", message);
        }

      
    }

   
}
