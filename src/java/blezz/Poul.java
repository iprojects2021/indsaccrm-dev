package blezz;

import email.EmergencyEmail;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringWriter;
import java.io.Writer;
import java.net.InetAddress;
import java.net.URL;
import java.net.UnknownHostException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.FileImageOutputStream;
import log.Log;
/*
 *
 * @author INDSAC
 */
public class Poul {

//test environment
   public static Connection getConnectionCRM(){
	Connection con=null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/indsaccr_development","root","mysql");
	}catch(Exception e){System.out.println(e);}
	return con;
    }  
public static String getDirPath(){
 return "E:\\LOG-DEV\\files\\crmfiles\\";}
public static String getProjectPath(){
//depend upon developer project location
return "E:\\indsac\\indsaccrm\\indsaccrm-dev\\web";
}
public static String getWeblogsDirPath(){ 
return "E:\\LOG-DEV\\files\\weblogs\\";
}

public static String getDevServerLink(){
    return  "http://103.171.180.74:33230/indsaccrm-dev/";
}
public static String getProdServerLink(){
    return  "http://localhost:8084/indsaccrm-dev/";
}

//test environment end



/*
//server dev environment start
   public static Connection getConnectionCRM() {
	Connection con=null;
	try{ 
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/indsaccr_development",Nd.Decrypt("2a2e2a75736572646576656c6f706d656e74"),Nd.Decrypt("2a2e2a377937656861386573"));
	}catch(Exception e){System.out.println(e);
         String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Poul.java-----\n"
                   + "\nLINE=62 \n Production: getConnectionCRM() ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       
        
        
        }
	return con;
    } 

  public static String getDirPath(){
String path="/home/indsaccr/dev/crmfiles/";

 return path;}
 public static String getProjectPath(){
String path="/home/indsaccr/webapps/indsaccrm-dev/";
return path;}
public static String getWeblogsDirPath(){
   String path="/home/indsaccr/dev/weblogs/"; 
return path;
}
public static String getProdServerLink(){
    return  "https://indsaccrm.com/";
}
 //prod server dev end
*/
   public static String getEmailResponseUser(){
//String path="";
String user="service@indsaccrm.com";
 return user;}
   
   
   
  public static String getEmailResponsePass(){
//String path="/home/indsaccr/files/";
String pass="2a2e2a7365727669636540323032316d61696c";
 return pass;}
    public static String getMonth(String number){
     if("01".equals(number)) {return "January";} 
     else if("02".equals(number)) {return "February";} 
     else if("03".equals(number)) {return "March";}
     else if("04".equals(number)) {return "April";}
     else if("05".equals(number)) {return "May";}
     else if("06".equals(number)) {return "June";}
     else if("07".equals(number)) {return "July";}
     else if("08".equals(number)) {return "August";}
     else if("09".equals(number)) {return "September";}
     else if("10".equals(number)) {return "October";}
     else if("11".equals(number)) {return "November";}
     else if("12".equals(number)) {return "December";}
     return "";
    
    }
    
    
     public static final HashMap m = new HashMap();
    static 
    {
        m.put(160, "&nbsp;"); // Non-breaking space
        m.put(60, "&lt;");    // < - less-than
        m.put(62, "&gt;");    // > - greater-than
	m.put(38, "&amp;");   //&- Ampersand
	m.put(162, "&cent;"); //¢- Cent
	m.put(163, "&pound;");//£-Pound
	m.put(165,"&yen;");   //Yen
	m.put(8364, "&euro;");// ¥ - Euro
	m.put(167, "&sect;"); // § - Section
	m.put(169, "&copy;"); // © - Copyright
	m.put(174, "&reg;");  // ® - Registered trademark
	m.put(8482, "&trade;");// ™ -Trademark
    }
    
   public static String shahash(String password) throws NoSuchAlgorithmException, SQLException
    {
        String value=null;
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(password.getBytes());
        byte byteData[] = md.digest();
        //convert the byte to hex format method 1
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }
        String ds=sb.toString();
      //  String fss=ds.substring(0,11);
     //   String sss=ds.substring(11,22);
     //   String tss=ds.substring(22);
       // value=matchuid(fss+"="+sss+"&"+tss);
       
    return  ds ;
    }
  public static String matchuid(String val) throws SQLException{
                 
            String uid=null;
            Connection con=getConnectionCRM();
            PreparedStatement st=con.prepareStatement("select * FROM compmaster");
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                String SR=rs.getString("c_");
                if(SR.equals(val)){ 
                    val=val+"=";
                    matchuid(val);
                }
                else{
                    uid=val;
                }
            }
              rs.close();
      st.close();
      con.close();
            return uid;
        }
      public static String decimalreduce(String val) throws SQLException{
             String input=val;    
          int length=0;
          length=input.length();
          int decindex=input.indexOf(".");
          if(decindex==-1){val=input;}
          else 
          if((length-decindex)>2){
              decindex=decindex+3;
              input=input.substring(0, decindex);
          val=input;
          }else {val=input;}
            return val;
        }
      
      public static final String[] units = { "", "One", "Two", "Three", "Four",
"Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve",
"Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen",
"Eighteen", "Nineteen" };

public static final String[] tens = { 
		"", 		// 0
		"",		// 1
		"Twenty", 	// 2
		"Thirty", 	// 3
		"Forty", 	// 4
		"Fifty", 	// 5
		"Sixty", 	// 6
		"Seventy",	// 7
		"Eighty", 	// 8
		"Ninety" 	// 9
};

public static String convert(final int n) {
	if (n < 0) {
		return "Minus " + convert(-n);
	}

	if (n < 20) {
		return units[n];
	}

	if (n < 100) {
		return tens[n / 10] + ((n % 10 != 0) ? " " : "") + units[n % 10];
	}

	if (n < 1000) {
		return units[n / 100] + " Hundred" + ((n % 100 != 0) ? " " : "") + convert(n % 100);
	}

	if (n < 100000) {
		return convert(n / 1000) + " Thousand" + ((n % 10000 != 0) ? " " : "") + convert(n % 1000);
	}

	if (n < 10000000) {
		return convert(n / 100000) + " Lakh" + ((n % 100000 != 0) ? " " : "") + convert(n % 100000);
	}

	return convert(n / 10000000) + " Crore" + ((n % 10000000 != 0) ? " " : "") + convert(n % 10000000);
}



   public static String numtochar(int j)
   {
   int i=0,k=0,l=0,m=0,n=0,p=0;
   char knn=0,knp=0,knq=0;
String s1=null,s2=null,s3=null;

if(j>702){

n=j%26;
j=j/26;
if(n==0)
{
    n=26;
    j=j-1;
}
knq=(char)(64+n);
s3=Character.toString(knq);

knn=(char)(64+j);
if(j>26)
{
    k=j/26;
    l=j%26;
    if(l==0)
    {
        l=26;
        k=k-1;
    }
    knn=(char)(64+k);
    knp=(char)(64+l);
}
s1=Character.toString(knn);
s2=Character.toString(knp);
s1=s1+s2+s3; 

return s1;
}else{
  knn=(char)(64+j);
  if(j>26){ 
      k=j/26;
      l=j%26;
      if(l==0){
          l=26;
          k=k-1; 
              }
      knn=(char)(64+k);
      knp=(char)(64+l);
  }
s1=Character.toString(knn);
s2=Character.toString(knp);
s1=s1+s2; 

return s1;
}
   
   }
  
    public void renameImage(String srcPath,String destPath) throws Exception
  {
        Iterator iter = ImageIO.getImageWritersByFormatName("jpeg");  
  
        ImageWriter writer = (ImageWriter)iter.next();  
  
        ImageWriteParam iwp = writer.getDefaultWriteParam();  
  
        iwp.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);  
  
        iwp.setCompressionQuality(0.5f);  
        
        FileInputStream inputStream = new FileInputStream(srcPath);  
        BufferedImage originalImage = ImageIO.read(inputStream);
        
        File file = new File(destPath);  
        FileImageOutputStream output = new FileImageOutputStream(file);  
        writer.setOutput(output);
  
        IIOImage image = new IIOImage(originalImage, null, null);  
        writer.write(null, image, iwp);  
        inputStream.close();
        output.close();
        writer.dispose();  
        File file1 = new File(srcPath);
        if(file1.exists()){
          if(file1.delete()){
           // System.out.println("delete DONE");
           }
          else{
         // System.out.println("delete not DONE");
          }
        }
       // System.out.println("DONE");  
    }  
     public boolean reduceQuality(String srcPath,String destPath) throws Exception{
         Iterator iter = ImageIO.getImageWritersByFormatName("jpeg");  
  
        ImageWriter writer = (ImageWriter)iter.next();  
  
        ImageWriteParam iwp = writer.getDefaultWriteParam();  
  
        iwp.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);  
  
        iwp.setCompressionQuality(0.5f);  
        
        FileInputStream inputStream = new FileInputStream(srcPath);  
        BufferedImage originalImage = ImageIO.read(inputStream);
        
        File file = new File(destPath);  
        FileImageOutputStream output = new FileImageOutputStream(file);  
        writer.setOutput(output);
  
        IIOImage image = new IIOImage(originalImage, null, null);  
        writer.write(null, image, iwp);  
        inputStream.close();
        output.close();
        writer.dispose();  
        File file1 = new File(srcPath);
        if(file1.exists()){
          if(file1.delete()){
            //System.out.println("delete DONE");
           }
          else{
          //System.out.println("delete not DONE");
          }
        }
        boolean b=file.renameTo(file1);
        //System.out.println("Renaming DONE"); 
        return b;
    }  
    public static Connection getConnection(){
	Connection con=null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jigar","root","mysql");
	}catch(Exception e){System.out.println(e);}
	return con;
    }
    

    
     public static String finalpassword(String userid,String pwd) throws NoSuchAlgorithmException
     {
        int liofuid=userid.lastIndexOf('@');
        String fuid=userid.substring(0,liofuid);
        String luid=userid.substring(liofuid+1);
        String uid=fuid+luid;
       String finalpassword="";
       String str0=":{?(;]!>/~";
       String str1="kolkhoznik";
       String str2="quantizing";
       String str3="zygomorphy";
       String str4="subjacency";
       int pwdlen=pwd.length();
       int uidlen=uid.length();
           if(uidlen<10){
           uid=uid+"zaxes";
           uidlen=uid.length();
       }
       StringBuilder sbsalt =new StringBuilder();
       int l=0;
       for(int j=0;j<uidlen;j++){
           sbsalt.append(uid.charAt(j));
           sbsalt.append(str1.charAt(l));
           sbsalt.append(str2.charAt(l));
           sbsalt.append(str0.charAt(l));
           sbsalt.append(str3.charAt(l));
           sbsalt.append(str4.charAt(l));
           l++;
           if(l==10){
               l=0;
           }
          }
       String finalsalt=sbsalt.toString();
      int finalsaltlen=finalsalt.length();
       StringBuilder fpass =new StringBuilder();
       
       int k=0;
       for(int j=0;j<finalsaltlen;j++){
           fpass.append(finalsalt.charAt(j));
           fpass.append(pwd.charAt(k));
           k++;
           if(k==pwdlen){
               k=0;
           }
          }
       finalpassword=fpass.toString();
       MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(finalpassword.getBytes());

        byte byteData[] = md.digest();

        //convert the byte to hex format method 1
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }

        String value=sb.toString();
        return  value ;
    }
      public static String escapeHtml(String str) {
	  if(str==null||str.equals("")){
              return str;
          }else{
        try {
            StringWriter writer = new StringWriter((int) 
                           (str.length() * 1.5));
            escape(writer, str);
            return writer.toString();
           } catch (IOException ioe) {
            ioe.printStackTrace();
            return null;
        }
          }
      }
 
    public static void escape(Writer writer, String str) throws IOException {
        int len = str.length();
        for (int i = 0; i < len; i++) {
            char c = str.charAt(i);
            int ascii = c;
            String entityName = (String) m.get(ascii);
            if (entityName == null) {
                if (c > 0x7F) {
                    writer.write("&#");
                    writer.write(Integer.toString(c, 10));
                    writer.write(';');
                } else {
                    writer.write(c);
                }
            } else {
                     writer.write(entityName);
            }
        }
    }

    public static String statusCustomerColor(String colortype){
    String color="";
    if("Active".equalsIgnoreCase(colortype)){return "info";}
    if("InActive".equalsIgnoreCase(colortype)){return "default";}
    else { return "";}
    }
     public static String statusVendorColor(String colortype){
    String color="";
    if("Active".equalsIgnoreCase(colortype)){return "info";}
    if("".equalsIgnoreCase(colortype)){return "default";}
    else { return "";}
    }
   
      public static String statusTaskColor(String taskstatus){
    String color="";
    if("Open".equalsIgnoreCase(taskstatus)){return "danger";}
    if("In Process".equalsIgnoreCase(taskstatus)){return "info";}
    if("Complete".equalsIgnoreCase(taskstatus)){return "success";}
    if("Cancelled".equalsIgnoreCase(taskstatus)){return "default";}
    if("Rejected".equalsIgnoreCase(taskstatus)){return "default";}
    if("Follow Up".equalsIgnoreCase(taskstatus)){return "warning";}
    else { return "";}
    }
      public static String statusTaskPriorityColor(String colortype){
    String color="";
    if("VeryHigh".equalsIgnoreCase(colortype)){return "danger";}
    if("Normal".equalsIgnoreCase(colortype)){return "info";}
    if("High".equalsIgnoreCase(colortype)){return "warning";}
    if("CriticalSituation".equalsIgnoreCase(colortype)){return "danger";}
    if("Midium".equalsIgnoreCase(colortype)){return "default";}
    if("Low".equalsIgnoreCase(colortype)){return "default";}
    else { return "";}
    }
        public static String statusSRApprovalColor(String taskstatus){
    String color="";
   
    if("Approved".equalsIgnoreCase(taskstatus)){return "success";}
    if("Cancelled".equalsIgnoreCase(taskstatus)){return "danger";}
   
    if("Pending".equalsIgnoreCase(taskstatus)){return "warning";}
    else { return "";}
    } 
      public static String statusSRColor(String taskstatus){
    String color="";
    if("Open".equalsIgnoreCase(taskstatus)){return "danger";}
    if("In Process".equalsIgnoreCase(taskstatus)){return "info";}
    if("Complete".equalsIgnoreCase(taskstatus)){return "success";}
    if("Cancelled".equalsIgnoreCase(taskstatus)){return "default";}
    if("Rejected".equalsIgnoreCase(taskstatus)){return "default";}
    if("Follow Up".equalsIgnoreCase(taskstatus)){return "warning";}
    else { return "";}
    }
      public static String statusSRPriorityColor(String colortype){
    String color="";
    if("Very High".equalsIgnoreCase(colortype)){return "danger";}
    if("Normal".equalsIgnoreCase(colortype)){return "info";}
    if("High".equalsIgnoreCase(colortype)){return "warning";}
    if("Critical Situation".equalsIgnoreCase(colortype)){return "danger";}
    if("Midium".equalsIgnoreCase(colortype)){return "default";}
    if("Low".equalsIgnoreCase(colortype)){return "default";}
    else { return "";}
    }
       public static String statusCasesColor(String colortype){
    String color="";
    if("Open".equalsIgnoreCase(colortype)){return "danger";}
    if("Close".equalsIgnoreCase(colortype)){return "default";}
    else { return "";}
    }
       public static String statusIRColor(String colortype){
    String color="";
      if("Open".equalsIgnoreCase(colortype)){return "danger";}
    if("Close".equalsIgnoreCase(colortype)){return "default";}
    else { return "";}
    }
       public static String statusIRPriorityColor(String colortype){
    String color="";
    if("Midium".equalsIgnoreCase(colortype)){return "warning";}
     if("High".equalsIgnoreCase(colortype)){return "info";}
       if("Low".equalsIgnoreCase(colortype)){return "warning";}
    else { return "";}
    }
       
       public static String statusEmployeeVerification(String colortype){
    String color="";
      if("Pending".equalsIgnoreCase(colortype)){return "warning";}
    if("Verified".equalsIgnoreCase(colortype)){return "success";}
    else { return "";}
    }
       
    public static String getPublicIP() throws UnknownHostException  {
    		String systemipaddress = "";
    return systemipaddress;}
  
}