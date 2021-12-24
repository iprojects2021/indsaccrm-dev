/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package blezz;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Sachin
 */
public class Nd {
    
  /*  public static String encrypt(String stringvalue) 
	{  Base64.Encoder encoder = Base64.getEncoder();
        String str = encoder.encodeToString(stringvalue.getBytes());
        return str;
	}

	public static String decrypt(String strToDecrypt) 
	{
		Base64.Decoder decoder = Base64.getDecoder();  
                String dStr = new String(decoder.decode(strToDecrypt)); 
                return dStr;
                
	}
        
 */       
        public static String getValue(String newValue, String dbValue){
if(("".equals(newValue))&&("".equals(dbValue)||"null".equals(dbValue)))
{return "";}

if(("null".equals(newValue))&&("".equals(dbValue)||"null".equals(dbValue)))
{return "";}

if((!"null".equals(newValue))&&(!"".equals(newValue)))
{return newValue+"new";}

if((!"null".equals(dbValue))&&(!"".equals(dbValue)))
{return dbValue+"db";}
return "";
}
  
            public static String showAccess(String accesstype,String useraccountype){
            
               
               if( "admin".equals(useraccountype) ){return "show";}
               else if("true".equals(accesstype) && "employee".equals(useraccountype) )
{return "show";}

return "dontshow";
}
            
            public static String Encrypt(String str){
                String salt="*.*";
                str=salt.concat(str);
            char ch[] = str.toCharArray();
            StringBuffer sb = new StringBuffer();
      for(int i = 0; i < ch.length; i++) {
         String hexString = Integer.toHexString(ch[i]);
         sb.append(hexString);
      }
      String result = sb.toString();
            return result;}
            
            public static String Decrypt(String str){
            String result = new String();
      char[] charArray = str.toCharArray();
      for(int i = 0; i < charArray.length; i=i+2) {
         String st = ""+charArray[i]+""+charArray[i+1];
         char ch = (char)Integer.parseInt(st, 16);
         result = result + ch;
      } result=result.substring(3, result.length());//removing salt from result
            return result;}
    
            public static String dateConverion(String date){
            SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Date date1;
		try {
			date1 = (Date) new SimpleDateFormat("MM/dd/yyyy").parse(date);// for converting the string date into the date var
			 date = format1.format(date1);// for converting the date var into the yyyy-mm-dd which is requored in db for getting the data
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
            return date;}
}
