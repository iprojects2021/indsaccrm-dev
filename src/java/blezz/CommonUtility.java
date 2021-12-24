/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package blezz;

/**
 *
 * @author Dell
 */
public class CommonUtility {
    
    public static String getCalenderDateFromTimeStamp(String timestamp){
             String check=(timestamp).substring(0,10);
                  check=Character.toString(check.charAt(5))+Character.toString(check.charAt(6))+"/"+Character.toString(check.charAt(8))+Character.toString(check.charAt(9))+"/"+Character.toString(check.charAt(0))+Character.toString(check.charAt(1))+Character.toString(check.charAt(2))+Character.toString(check.charAt(3));
       
        return check;
    }
      public static String getTimeStampFromCalenderDate(String CalenderDate){
              CalenderDate=CalenderDate.substring(0,10);
       CalenderDate=Character.toString(CalenderDate.charAt(6))+Character.toString(CalenderDate.charAt(7))+Character.toString(CalenderDate.charAt(8))+Character.toString(CalenderDate.charAt(9))+"-"+Character.toString(CalenderDate.charAt(0))+Character.toString(CalenderDate.charAt(1))+"-"+Character.toString(CalenderDate.charAt(3))+Character.toString(CalenderDate.charAt(4))+" "+"23:59:59";
    
        return CalenderDate;
    }
    public static String getDashBoardAmount(Float n){
      
          if(n<=1000){return String.valueOf(n); }
           if(n>1000 && n<=100000){String calculate=String.valueOf(n/1000);
           if(calculate.length()>5){return calculate.substring(0, 5)+" K";}
           return calculate+" K";
           }
           if(n>100000 && n<=10000000){String calculate=String.valueOf(n/100000);
           if(calculate.length()>5){return calculate.substring(0, 5)+" L";}
           return calculate+" L"; }
          if(n>10000000 && n<=1000000000){String calculate=String.valueOf(n/10000000);
          if(calculate.length()>5){return calculate.substring(0, 5)+" Cr";}
          return calculate+" Cr"; }
          else
      return String.valueOf(n);}
    
    public static String getMonthName(int n){
    if(n==1){return "January";}
    if(n==2){return "February";}
    if(n==3){return "March";}
    if(n==4){return "April";}
    if(n==5){return "May";}
    if(n==6){return "June";}
    if(n==7){return "July";}
    if(n==8){return "August";}
    if(n==9){return "September";}
    if(n==10){return "October";}
    if(n==11){return "November";}
    if(n==12){return "December";}
    return "";}
    
      public static String getMonthShortName(int n){
    if(n==1){return "Jan";}
    if(n==2){return "Feb";}
    if(n==3){return "Mar";}
    if(n==4){return "Apr";}
    if(n==5){return "May";}
    if(n==6){return "Jun";}
    if(n==7){return "Jul";}
    if(n==8){return "Aug";}
    if(n==9){return "Sep";}
    if(n==10){return "Oct";}
    if(n==11){return "Nov";}
    if(n==12){return "Dec";}
    return "";}
      
     
    
}
