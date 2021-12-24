
/*What this page does? Sends the mails to selected emails form the Emailtable.jsp 
 * What are the varialbes 
 * //host var for storing host value
 * port var for storing port value
 * user var for storing username value
 * pass var for storing password value
 * List<File> uploadedFiles  for storing  the uploaded file
 *  List<String> email var for storing all the emails
 *  subject string var subject form the jsp page
 * content string var content form the jsp page 
 *  resultMessage varfor storing resultMessage
 *  recipient var for accessing selectedemail one by one and sending mail to them
 * methods-(parameter) no methods
 * getServletConfig();// for accessing the init parameters of this servlet
 * getInitParameter("host");//for the getting the value of host form the init parameter
 * saveUploadedFiles(request);// for getting the uploaded file content from the jsp
 * getAttribute("emails");// for the emails to which mail is going to be sent
 * .getParameter("subject");//for the getting wirtten subject in the jsp page 
 * getParameter("content");//for the getting wirtten content in the jsp page
 * sendEmailWithAttachment(host, port, user, pass,recipient, subject, content, uploadedFiles);//for sending the mail this is custom method of EmailUtility class
 * session.setAttribute("subject", subject);//for setting the subject in the session for later access
 * session.setAttribute("content", subject);//for setting the content in the session for later access
 * Date Created :10-06-2020
 * Created By:-Tapswi Godara
 * 
 */


 
import blezz.EmailUtility2;
import blezz.Nd;
import blezz.Poul;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import log.Log;
import menu.Email;
 
/**
 * A servlet that takes message details from user and send it as a new e-mail
 * through an SMTP server. The e-mail message may contain attachments which
 * are the files uploaded from client.
 *
 * 
 *
 */

@WebServlet(
        urlPatterns = "/SendMailAttachServlet"
      )
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,   // 2MB
                maxFileSize = 1024 * 1024 * 10,         // 10MB
                maxRequestSize = 1024 * 1024 * 50)      // 50MB

public class SendMailAttachServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String host;//host var for storing host value
    private String port;//port var for storing port value
    private String user;// user var for storing username value
    private String pass;// pass var for storing password value
 
    public void init() {
        // reads SMTP server setting from annotations
    	
    }
 
    /**
     * handles form submission
     */
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        // uploadedFiles for storing  the uploaded file 
        
        String usercid_id = (String) session.getAttribute("usercid_id");
        String usercid_adminid = (String) session.getAttribute("usercid_adminid");
  String data[]=new String [5];    
data=Email.getActiveEmailSettingDetail(usercid_adminid, usercid_id);
user=data[1];

pass=Nd.Decrypt(data[2]);
host=data[3];
port=data[4];
    
        
        List<File> uploadedFiles = saveUploadedFiles(request,response);// for getting the uploaded file content from the jsp
        // email var for storing all the emails
        List<String> email  = (List<String>)session.getAttribute("emails");// for the emails to which mail is going to be sent 
        
        String subject = request.getParameter("subject");//for the getting wirtten subject in the jsp page 
        String content = request.getParameter("content");//for the getting wirtten content in the jsp page
        String content1= "\n \n" 
                        +"<br>Send from <a target=\"_blank\" href=\"https://indsaccrm.com\" >INDSAC CRM Software</a><br> Best online software for your business<br>Create invoices,Customer management,Task Management,Send Bulk Email and many more<br>Register Now:<a target=\"_blank\" href=\"https://indsaccrm.com\" >www.indsaccrm.com </a><br> ";
       
          content1 =content+content1;
          session.setAttribute("useremail", user);
        session.setAttribute("subject", subject);//for setting the subject in the session for later access
        session.setAttribute("content", content);//for setting the content in the session for later access
        // resultMessage varfor storing resultMessage
        String resultMessage = "";
 
        try {
        	//recipient var for accessing selectedemail one by one and sending mail to them
        	for(String recipient: email){
              
                EmailUtility2.sendEmailWithAttachment(host, port, user, pass,
                		recipient, subject, content1, uploadedFiles);//for sending the mail this is custom method of EmailUtility class
         	   }
           
             
            resultMessage = "The e-mail was sent successfully";
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "There were an error: " + ex.getMessage();
        } finally {
          
            request.setAttribute("message", resultMessage);//setting the attribute to send to the next servlet
            getServletContext().getRequestDispatcher("/SaveEmailToDb").forward(
                    request, response);// forwarding the control to the Saveemailtodb servlet
        }
    }
 
    /**
     * Saves files uploaded from the client and return a list of these files
     * which will be attached to the e-mail message.
     */
    private List<File> saveUploadedFiles(HttpServletRequest request,HttpServletResponse response)
            throws IllegalStateException, IOException, ServletException {
    	int i=0;
        HttpSession session = request.getSession();
        System.out.println("Inside saveUploadedFiles method");
        List<File> listFiles = new ArrayList<File>();// for storing the file from the jsp 
        byte[] buffer = new byte[4096];//creates a buffer
        int bytesRead = -1; Collection<Part> multiparts = null;
        try{
        multiparts = request.getParts();// gets the file form the jsp
        }catch(Exception e){
           response.sendRedirect("/searchcontact.jsp?error=File+Size+Exceeds");
             Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"   /n"+e);
       }
        System.out.println(multiparts.size());
        if (multiparts.size() > 0) {
            for (Part part : request.getParts()) {
                // creates a file to be saved
                String fileName = extractFileName(part);
                System.out.println("Filename:"+fileName);
                if (fileName == null || fileName.equals("")) {
                    // not attachment part, continue
                  continue;
                }
                // root for storing root directory 
                String root = Poul.getDirPath();//gets the root directory   
				File path = new File(root +File.separator+ "mailattachment");//gets the paths for storing the file                      
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
	               String saveFileDir=path + "/" + filename + filesavetime+"." + fileNameSplits[extensionIndex];
	              String filenametodb="";
                      filenametodb=filename + filesavetime+"." + fileNameSplits[extensionIndex];
                       System.out.println("Directory Name:"+saveFileDir);
                        System.out.println("Value of i="+i);
	               System.out.println(i+"FileName:"+filenametodb);
	               
	               File saveFile = new File(saveFileDir);  //save the file in root directory                       
				
				 String attachmentdir[] = new String[i+1];//for storing the directories of the upload file
				 attachmentdir[i]=filenametodb;
				 System.out.println( attachmentdir[i]);
				session.setAttribute("attachmentdir"+i, attachmentdir[i]);// setting the directories ofupload file 
				System.out.println("Inside sendmailattachservlet----setAttribute-dirlenght:"+ i);
                                session.setAttribute("dirlength", i);// setting the length for array with number of files 
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
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return null;
    }
     
   
}