/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package s3453;

import blezz.Poul;
import email.EmergencyEmail;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.channels.FileChannel;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import log.Log;
import org.apache.commons.io.FileUtils;
/**
 *
 * @author Dell
 */
@WebServlet(name = "DownloadFile", urlPatterns = {"/DownloadFile"})
public class DownloadFile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session1 = request.getSession(); // reuse existing
     String usercid_adminid=(String)session1.getAttribute("usercid_adminid");
          
          String usercid_id=(String)session1.getAttribute("usercid_id");
         
        String filename=request.getParameter("filename");
        String type=request.getParameter("type");
        
        
       if("files".equals(type)){
        String source = Poul.getDirPath()+File.separator+"files"+File.separator+filename;
       String  dest=Poul.getProjectPath()+File.separator+"download"+File.separator+filename;
        java.io.File sourcefile = new java.io.File(source);
          java.io.File destfile = new java.io.File(dest);
       File file = new File(".");
      //copyFileUsingChannel(sourcefile, destfile);
      try {   FileUtils.copyFile(sourcefile, destfile);
    } catch (IOException e) {
                    String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=s3453 , File=DownloadFile.java , Type=Files, Filename="+filename+"-----\n"
    + "\nLINE=63 \n  useradminid=="+usercid_adminid+" usercid="+usercid_id+"  ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
        }
      if (!destfile.exists()){
        try {
                TimeUnit.SECONDS.sleep(2);
                  try {   FileUtils.copyFile(sourcefile, destfile);
    } catch (IOException e) {
                    String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=s3453 , File=DownloadFile.java , Type=Files, Filename="+filename+"-----\n"
    + "\nLINE=63 \n  useradminid=="+usercid_adminid+" usercid="+usercid_id+"  ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
        }
            } catch (InterruptedException ex) {
          Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n  /n"+ex);
     }
      }
 Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+", --File Copied Successfully Ready for Download-Type=Files, Filename="+filename+"--");
     }
       if("mailattachment".equals(type)){
        String source = Poul.getDirPath()+File.separator+"mailattachment"+File.separator+filename;
       String  dest=Poul.getProjectPath()+File.separator+"download"+File.separator+filename;
        java.io.File sourcefile = new java.io.File(source);
          java.io.File destfile = new java.io.File(dest);
       File file = new File(".");
      //copyFileUsingChannel(sourcefile, destfile);
      try {   FileUtils.copyFile(sourcefile, destfile);
      
    } catch (IOException e) {
                    String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=s3453 , File=DownloadFile.java , Type=Files, Filename="+filename+"-----\n"
    + "\nLINE=83 \n  useradminid=="+usercid_adminid+" usercid="+usercid_id+"  ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
        }  
      if(destfile.exists()){System.out.println("Download File Exists");}
      
      if (!destfile.isFile()){
            try {
                TimeUnit.SECONDS.sleep(10);
                System.out.println("Waiting...");
            } catch (InterruptedException ex) {
          Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n  /n"+ex);
     }}
 Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+", --File Copied Successfully Ready for Download-Type=mailattachment, Filename="+filename+"--");
     }
    
         
       
       
       
       
       
       try{TimeUnit.SECONDS.sleep(2);  }
       catch(Exception e){Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+", Line=118--Waiting Time 2 second Error File=Download File --");
  }
   
    
    }

   private static void copyFileUsingChannel(File source, File dest) throws IOException {
    FileChannel sourceChannel = null;
    FileChannel destChannel = null;
    try {
        sourceChannel = new FileInputStream(source).getChannel();
        destChannel = new FileOutputStream(dest).getChannel();
        destChannel.transferFrom(sourceChannel, 0, sourceChannel.size());
       }finally{
           sourceChannel.close();
           destChannel.close();
   }
} // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
public static void copyFileNIO(String from, String to) throws IOException {

        Path fromFile = Paths.get(from);
        Path toFile = Paths.get(to);

        // if fromFile doesn't exist, Files.copy throws NoSuchFileException
        if (Files.notExists(fromFile)) {
            System.out.println("File doesn't exist? " + fromFile);
            return;
        }

        // if toFile folder doesn't exist, Files.copy throws NoSuchFileException
        // if toFile parent folder doesn't exist, create it.
        Path parent = toFile.getParent();
        if(parent!=null){
            if(Files.notExists(parent)){
                Files.createDirectories(parent);
            }
        }

        // default - if toFile exist, throws FileAlreadyExistsException
        Files.copy(fromFile, toFile);

        // if toFile exist, replace it.
        // Files.copy(fromFile, toFile, StandardCopyOption.REPLACE_EXISTING);

        // multiple StandardCopyOption
        /*CopyOption[] options = { StandardCopyOption.REPLACE_EXISTING,
                StandardCopyOption.COPY_ATTRIBUTES,
                LinkOption.NOFOLLOW_LINKS };

        Files.copy(fromFile, toFile, options);*/

    }
}
