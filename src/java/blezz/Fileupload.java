/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package blezz;

import email.EmergencyEmail;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import log.Log;
import org.apache.commons.io.FileUtils;

/**
 *
 * @author Dell
 */
@WebServlet(name = "Fileupload", urlPatterns = {"/Fileupload"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,   // 2MB
                maxFileSize = 1024 * 1024 * 10,         // 10MB
                maxRequestSize = 1024 * 1024 * 50)      // 50MB
public class Fileupload extends HttpServlet {

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
         HttpSession session = request.getSession();
          HttpSession session1 = request.getSession(); // reuse existing
    String FileDirName="files";//Need to update based on Directory name
          String usercid_id=(String)session1.getAttribute("usercid_id");
         String usercid_adminid=(String)session1.getAttribute("usercid_adminid");
      String expensedate=request.getParameter("expensedate");
         String type=request.getParameter("type");
        String general=request.getParameter("general");
       if(general!=null){ general=Nd.Decrypt(general);}
        
        
         Log.writeLog("Debug: "+java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+", Fileupload.java Entered Type="+type+",General="+general+"");
    
   List<File> uploadedFiles;
        uploadedFiles = saveUploadedFiles(request,FileDirName);
         Log.writeLog("Debug: "+java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+", Fileupload.java After menu.Upload.saveUploadedFiles(request)");
    
          int dirlength = 0;
          try{
        dirlength = (Integer) session.getAttribute("dirlength");
       
          }
          catch(Exception e)
          {Log.writeLog("File=Fileupload.java-----inside dirlenght catch exception");
              dirlength=0;}
          
           String attachmentdir[] = new String[dirlength + 1];
       
        for (int i = 0; i <= dirlength; i++) {
            attachmentdir[i] = (String) session.getAttribute("attachmentdir" + i);
           

        }
        
        //Save all filenames to one string
          String attachmentfilename="";
        for (int i = 0; i <= dirlength; i++) {
            attachmentfilename=attachmentfilename+attachmentdir[i]+";";
            }
        Log.writeLog("Debug: "+java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+", Fileupload.java After attachmentfilename:"+attachmentfilename);
            
        // Remove Session attribute
        for (int i = 0; i <= dirlength; i++) {
            
             session.removeAttribute("attachmentdir" + i);
            }
          session.removeAttribute("dirlength");
          
          
          //Save to DB and Redirecting
        if("expensereceipt".equals(type))
        {Log.writeLog("Debug: Before DB update, Type="+type);
        String expensedb=menu.Expense.saveExpenseReceipttoDB(usercid_adminid, usercid_id, general, attachmentfilename,expensedate);
        Log.writeLog("Debug: Redirecting to expenseedit.jsp?tid="+general);
            response.sendRedirect("expenseedit.jsp?2a2e2a746964="+Nd.Encrypt(general));
        }
          if("invoicelogoupload".equals(type))
  {   //copy uploaded file from server dir to project dir to view image in UI
      String filename="";filename=attachmentfilename.substring(0, attachmentfilename.length()-1);
            String source = Poul.getDirPath()+File.separator+"files"+File.separator+ filename;
         String  dest=Poul.getProjectPath()+File.separator+"uploads"+File.separator+ "logo"+File.separator+filename;
         java.io.File sourcefile = new java.io.File(source);
          java.io.File destfile = new java.io.File(dest);
          File file = new File(".");
        //copyFileUsingChannel(sourcefile, destfile);
          try {   FileUtils.copyFile(sourcefile, destfile);
              } catch (IOException e) {
                    String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=blezz , File=Fileupload.java , Type=Files, Filename="+filename+"-----\n"
               + "\nLINE=121 \n  useradminid=="+usercid_adminid+" usercid="+usercid_id+"  ";
                Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
                EmergencyEmail.send(e,errormsg); 
             }
        Log.writeLog("Debug: Before DB update, Type="+type+" Filename="+attachmentfilename);
        String expensedb=menu.AdminDefaultValues.saveInvoiceLogotoDB(usercid_adminid, usercid_id, attachmentfilename);
        Log.writeLog("Debug: Redirecting to invoicesetting.jsp");
               try{TimeUnit.SECONDS.sleep(5);  }
       catch(Exception e){Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+", Line=118--Waiting Time 2 second Error File=Download File --");
       }  
        response.sendRedirect("invoicesetting.jsp?smsg=Invoice+Logo+uploaded+Successfully");
    }
          
           if("taskfile".equals(type))
        {Log.writeLog("Debug: Before DB update, Type="+type);
        String expensedb=menu.Task.saveTaskFileNametoDB(usercid_adminid, usercid_id, general, attachmentfilename);
        Log.writeLog("Debug: Redirecting to taskedit.jsp?tid="+general);
            response.sendRedirect("taskedit.jsp?2a2e2a746964="+Nd.Encrypt(general)+"&msg=upload");
        }
           
         if("businessprofile".equals(type)){
           Log.writeLog("Debug: Before DB update, Type="+type);
        String expensedb=menu.BusinessProfileService.saveBusinessProfileLogotoDB(usercid_adminid, usercid_id, general, attachmentfilename);
        Log.writeLog("Debug: Redirecting to businessprofile.jsp?businessprofileid="+general);
            
            response.sendRedirect("businessprofile.jsp?"+"&message=succesfulyUploaded ");  
         
         } 
         
         if("userprofile".equals(type)){
           Log.writeLog("Debug: Before DB update, Type="+type);
        String expensedb=menu.UserProfileService.saveUserProfileLogotoDB(usercid_adminid, usercid_id, general, attachmentfilename);
        Log.writeLog("Debug: Redirecting to businessprofile.jsp?userprofileid="+general);
            
            response.sendRedirect("userprofile.jsp?"+"&message=succesfulyUploaded ");  
         
         } 
      
 }
      public static List<java.io.File> saveUploadedFiles(HttpServletRequest request,String FileDirName)
            throws IllegalStateException, IOException, ServletException {
    	int i=0;
        HttpSession session = request.getSession();
       
        List<java.io.File> listFiles = new ArrayList<java.io.File>();// for storing the file from the jsp 
        byte[] buffer = new byte[4096];//creates a buffer
        int bytesRead = -1;
        Collection<Part> multiparts = request.getParts();// gets the file form the jsp
     //   Log.writeLog("Debug: "+java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" Fileupload.java method=saveUploadedFiles(), Mulitpart size="+multiparts.size());
      
        if (multiparts.size() > 0) {
            for (Part part : request.getParts()) {
                // creates a file to be saved
                String fileName = extractFileName(part);
          //  Log.writeLog("Debug: "+java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" Fileupload.java method=saveUploadedFiles(), fileName="+fileName);
          
                if (fileName == null || fileName.equals("")) {
                    // not attachment part, continue
                  continue;
                }
                // root for storing root directory 
                String root = Poul.getDirPath();//gets the root directory   
				java.io.File path = new java.io.File(root +java.io.File.separator+ FileDirName);//gets the paths for storing the file                      
				if (!path.exists()) {                  // checks if path exists or not  	 
					path.mkdirs();// if not creates the path
				} 
		//	now var	stores the date time  
				LocalDateTime now = LocalDateTime.now();// gets the local time
		// myTFormatObj stores the format pattern 
				DateTimeFormatter myTFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH-mm-ss");//formating the time to name the attachment
		// filesavetime stores the time in form string in specified format
				String filesavetime = now.format(myTFormatObj);// converts date into string in this yyyy-MM-dd HH-mm-ss format
			  //we are splitting file name here such that we can get file name and extension differently
	               String[] fileNameSplits = fileName.split("\\.");
	              // extension is assumed to be the last part
	               int extensionIndex = fileNameSplits.length - 1;
	               //filename stores the filename
	               String filename = fileName.split("\\.")[0];
	               // saveFileDir stores the directory where file will be saved
	               String saveFileDir=path + "/" + filesavetime+"." + fileNameSplits[extensionIndex];
	              String filenametodb="";
                      filenametodb= filesavetime+"." + fileNameSplits[extensionIndex];
                       
	              //   Log.writeLog("Debug: "+java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" Fileupload.java method=saveUploadedFiles(), filenametodb="+filenametodb);
          
	               java.io.File saveFile = new java.io.File(saveFileDir);  //save the file in root directory                       
				
				 String attachmentdir[] = new String[i+1];//for storing the directories of the upload file
				 attachmentdir[i]=filenametodb;
				
				session.setAttribute("attachmentdir"+i, attachmentdir[i]);// setting the directories ofupload file 
				
                                session.setAttribute("dirlength", i);// setting the length for array with number of files 
                
                             //   Log.writeLog("Debug: "+java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" Fileupload.java method=saveUploadedFiles()  ,attachmentdir"+i+"="+attachmentdir[i]+", dirlength="+i);
     
                                FileOutputStream outputStream = new FileOutputStream(saveFile);
                 
                // saves uploaded file
                InputStream inputStream = part.getInputStream();
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                outputStream.close();
                inputStream.close();
               i++;  
                listFiles.add(saveFile);
            }
        }
        return listFiles;
    }
 
    /**
     * Retrieves file name of a upload part from its HTTP header
     */
    public static String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                String filename=s.substring(s.indexOf("=") + 2, s.length() - 1);
                return filename;
            }
        }
        return null;
    }
    
 
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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

}
