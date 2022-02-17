/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package CommonUtil;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author JAGRUTI
 */
public class FormValidation {
    
    
        
       public static boolean isValidMobileNo(String str){
       
       Pattern ptrn= Pattern.compile("(0/91)?[7-9][0-9]{9}");
       
       Matcher match= ptrn.matcher(str);
                   
       return (match.find()&& match.group().equals(str)); 
       
       
       
   }
   
   public static boolean isValidEmail(String str){
       
       String emailRegex="^[A-Z0-9._%+-]+@[A-z0-9.-]+\\.[A-Z]{2,6}$";
       
    
       Pattern ptrn= Pattern.compile(emailRegex,Pattern.CASE_INSENSITIVE);
       
       Matcher match = ptrn.matcher(str);
       
       return match.find();      
   }
   
   public static boolean isStringOnlyAlphabate(String str){
       
   return ((str != null) && (!str.equals(""))&& (str.matches("^[a-zA-Z]*$")));             
   }
   
   public static boolean isUniversal(String str){
       
       Pattern ptrn = Pattern.compile("^[A-Z0-9._%+-]+@[A-z0-9.-]+\\.[A-Z]{2,6}$");
       
       Matcher match = ptrn.matcher(str);
       
       return match.find();      
   }
    
}   
