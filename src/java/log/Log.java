/*
 * Copyright (c) 2016 INDSAC SOFTECH All Rights Reserved
 *
 * Author: 
 * Change History:
 * 1.   - Created.
 */

package log;
import blezz.Poul;  
  
import java.io.*;  
import java.time.LocalDate;

import java.util.*; 
import java.util.logging.Level;
import org.apache.log4j.Logger;
/**
 *
 * @author Sachin
 */
public class Log {
    
     static Logger log = Logger.getLogger(Log.class.getName());  
    public static final String LOG_DIR = "/logfiles/";
    public static final String LOG_BASE = "iCRMLog";
    public static final String LOG_FILE_EXT = ".log";
   
    
    
public static void writeLog(String txt){
    
 log.info(txt);  
 
}

public static void writeLogWarn(String txt){
    
 log.warn(txt);  
 
}

public static void writeLogError(String txt){
    
 log.error(txt);  
 
}
// *************************************Weblogs*****************************************************************************************************************

 
   public static void writeWEBLog(String text){  
    LocalDate date= java.time.LocalDate.now();
    String currentDate=date.toString();
   
File file = new File(Poul.getWeblogsDirPath()+"iCRMWEBLOG-"+currentDate+".txt"); //initialize File object and passing path as argument  
boolean result;  
try  
{  
result = file.createNewFile();  //creates a new file  
if(result)      // test if successfully created a new file  
{  
//System.out.println("file created "+file.getCanonicalPath()); //returns the path string  
}  
else  
{  
//System.out.println("File already exist at location: "+file.getCanonicalPath());  
}  
}  
catch (IOException e)  
{  
e.printStackTrace();    //prints exception if any  
}
       try {
           
           FileWriter mywrite=new FileWriter(Poul.getWeblogsDirPath()+"iCRMWEBLOG-"+currentDate+".txt", true);
           mywrite.write(System.lineSeparator() +text);
      mywrite.close();
     
       } catch (IOException ex) {
           java.util.logging.Logger.getLogger(Log.class.getName()).log(Level.SEVERE, null, ex);
              System.out.println("An error occurred.");
      ex.printStackTrace();
       }
}  
   
   
   public static void writeWEBLogWarn(String text){  
    LocalDate date= java.time.LocalDate.now();
    String currentDate=date.toString();
   
File file = new File(Poul.getWeblogsDirPath()+"iCRMWEBWARNLOG-"+currentDate+".txt"); //initialize File object and passing path as argument  
boolean result;  
try  
{  
result = file.createNewFile();  //creates a new file  
if(result)      // test if successfully created a new file  
{  
//System.out.println("file created "+file.getCanonicalPath()); //returns the path string  
}  
else  
{  
//System.out.println("File already exist at location: "+file.getCanonicalPath());  
}  
}  
catch (IOException e)  
{  
e.printStackTrace();    //prints exception if any  
}
       try {
           
           FileWriter mywrite=new FileWriter(Poul.getWeblogsDirPath()+"iCRMWEBLOG-"+currentDate+".txt", true);
           mywrite.write(System.lineSeparator() +text);
      mywrite.close();
      } catch (IOException ex) {
           java.util.logging.Logger.getLogger(Log.class.getName()).log(Level.SEVERE, null, ex);
              System.out.println("An error occurred.");
      ex.printStackTrace();
       }
}  
   
    public static void writeWEBLogError(String text){  
    LocalDate date= java.time.LocalDate.now();
    String currentDate=date.toString();
   
File file = new File(Poul.getWeblogsDirPath()+"iCRMWEBLOGerror-"+currentDate+".txt"); //initialize File object and passing path as argument  
boolean result;  
try  
{  
result = file.createNewFile();  //creates a new file  
if(result)      // test if successfully created a new file  
{  
//System.out.println("file created "+file.getCanonicalPath()); //returns the path string  
}  
else  
{  
//System.out.println("File already exist at location: "+file.getCanonicalPath());  
}  
}  
catch (IOException e)  
{  
e.printStackTrace();    //prints exception if any  
}
       try {
           
           FileWriter mywrite=new FileWriter(Poul.getWeblogsDirPath()+"iCRMWEBLOG-"+currentDate+".txt", true);
      mywrite.close();
      } catch (IOException ex) {
           java.util.logging.Logger.getLogger(Log.class.getName()).log(Level.SEVERE, null, ex);
              System.out.println("An error occurred.");
      ex.printStackTrace();
       }
} 

/*
    
    public static String getLogPath(){
     // String path="/home/indsaccr/files/crmlogfiles/";
      String path="D:\\LOG\\";
        return path;
    }
    
   public static void writeLog(String text){  
    LocalDate date= java.time.LocalDate.now();
    String currentDate=date.toString();
    
File file = new File(Log.getLogPath()+"iCRMLOG-"+currentDate+".txt"); //initialize File object and passing path as argument  
boolean result;  
try   
{  
result = file.createNewFile();  //creates a new file  
if(result)      // test if successfully created a new file  
{  
//System.out.println("file created "+file.getCanonicalPath()); //returns the path string  
}  
else  
{  
//System.out.println("File already exist at location: "+file.getCanonicalPath());  
}  
}   
catch (IOException e)   
{  
e.printStackTrace();    //prints exception if any  
} 
       try {
           
           FileWriter mywrite=new FileWriter(Log.getLogPath()+"iCRMLOG-"+currentDate+".txt", true);
           mywrite.write(System.lineSeparator() +text);
      mywrite.close();
      
       } catch (IOException ex) {
           java.util.logging.Logger.getLogger(Log.class.getName()).log(Level.SEVERE, null, ex);
              System.out.println("An error occurred.");
      ex.printStackTrace();
       }
}   
    
    
   public static void writeLogWarn(String text){  
    LocalDate date= java.time.LocalDate.now();
    String currentDate=date.toString();
    
File file = new File(Log.getLogPath()+"iCRMLOG-"+currentDate+".txt"); //initialize File object and passing path as argument  
boolean result;  
try   
{  
result = file.createNewFile();  //creates a new file  
if(result)      // test if successfully created a new file  
{  
//System.out.println("file created "+file.getCanonicalPath()); //returns the path string  
}  
else  
{  
//System.out.println("File already exist at location: "+file.getCanonicalPath());  
}  
}   
catch (IOException e)   
{  
e.printStackTrace();    //prints exception if any  
} 
       try {
           
           FileWriter mywrite=new FileWriter(Log.getLogPath()+"iCRMLOG-"+currentDate+".txt", true);
           mywrite.write(System.lineSeparator() +text);
      mywrite.close();
      } catch (IOException ex) {
           java.util.logging.Logger.getLogger(Log.class.getName()).log(Level.SEVERE, null, ex);
              System.out.println("An error occurred.");
      ex.printStackTrace();
       }
}   
   
    public static void writeLogError(String text){  
    LocalDate date= java.time.LocalDate.now();
    String currentDate=date.toString();
    
File file = new File(Log.getLogPath()+"iCRMLOGerror-"+currentDate+".txt"); //initialize File object and passing path as argument  
boolean result;  
try   
{  
result = file.createNewFile();  //creates a new file  
if(result)      // test if successfully created a new file  
{  
//System.out.println("file created "+file.getCanonicalPath()); //returns the path string  
}  
else  
{  
//System.out.println("File already exist at location: "+file.getCanonicalPath());  
}  
}   
catch (IOException e)   
{  
e.printStackTrace();    //prints exception if any  
} 
       try {
           
           FileWriter mywrite=new FileWriter(Log.getLogPath()+"iCRMLOG-"+currentDate+".txt", true);
           mywrite.write(System.lineSeparator() +text);
      mywrite.close();
      } catch (IOException ex) {
           java.util.logging.Logger.getLogger(Log.class.getName()).log(Level.SEVERE, null, ex);
              System.out.println("An error occurred.");
      ex.printStackTrace();
       }
}   
*/
   
}
