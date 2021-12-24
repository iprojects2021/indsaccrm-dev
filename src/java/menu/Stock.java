/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package menu;

import blezz.Poul;
import email.EmergencyEmail;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import log.Log;

/**
 *
 * @author Dell
 */
public class Stock {
     public static String getProductQuantityInStock(String usercid_adminid,String stockid) throws IOException{
   int count='0';String result="0";
         
      
        try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("SELECT quantity FROM stock where useradminid=? and id=?   ");
      smt.setString(1,usercid_adminid);
       smt.setString(2,stockid); 
        
       ResultSet rs=smt.executeQuery();
        int i=1,j=1;
        while(rs.next()){
           result=rs.getString(1);
       }
        rs.close();
      smt.close();
      con.close();
      if(result==null){result="0";}
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=Stock.java  method=getCountInvoiceProductSold(String usercid_adminid,String stockid) count="+result+" ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Stock.java , method=getCountInvoiceProductSold(String usercid_adminid,String stockid)-----\n"
    + "\nLINE=142 \n SELECT quantity FROM stock where useradminid="+usercid_adminid+"  and stockid="+stockid+"    ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
        return result;}
    
}
