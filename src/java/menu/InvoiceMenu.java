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
import java.util.ArrayList;
import log.Log;

/**
 *
 * @author Dell
 */
public class InvoiceMenu {
    
    public static String getCountUnpaidInvoices(String usercid_adminid) throws IOException{
   int count='0';String result="0";
         
      
        try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("SELECT count(id) FROM invoice where useradminid=? and bk_!='0'  ");
      
        smt.setString(1,usercid_adminid);
       ResultSet rs=smt.executeQuery();
        int i=1,j=1;
        while(rs.next()){
           result=rs.getString(1);
       }
        rs.close();
      smt.close();
      con.close();
      if(result==null){result="0";}
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=InvoiceMenu.java  method=getCountUnpaidInvoices(String usercid_adminid) count="+result+" ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=InvoiceMenu.java , method=getCountUnpaidInvoices(String usercid_adminid)-----\n"
    + "\nLINE=47 \n SELECT count(id) FROM invoice where useradminid="+usercid_adminid+"     ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
        return result;}
    
      public static String getTotalDueAmountUnpaidInvoices(String usercid_adminid) throws IOException{
   int count='0';String result="0";
         
      
        try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("SELECT sum(bk_) FROM invoice where useradminid=? and bk_!='0'  ");
      
        smt.setString(1,usercid_adminid);
       ResultSet rs=smt.executeQuery();
        int i=1,j=1;
        while(rs.next()){
           result=rs.getString(1);
       }
        rs.close();
      smt.close();
      con.close();
      if(result==null){result="0";}
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=InvoiceMenu.java  method=getTotalDueAmountUnpaidInvoices(String usercid_adminid) count="+result+" ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=InvoiceMenu.java , method=getTotalDueAmountUnpaidInvoices(String usercid_adminid)-----\n"
    + "\nLINE=76 \n SELECT count(id) FROM invoice where useradminid="+usercid_adminid+"     ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
        return result;} 
      
       public static String getInvoiceFormat(String usercid_adminid) throws IOException{
  String result="def";
         
      
        try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("SELECT invoiceformat FROM admindefaultvalues  where useradminid=?   ");
      
        smt.setString(1,usercid_adminid);
       ResultSet rs=smt.executeQuery();
        int i=1,j=1;
        while(rs.next()){
           result=rs.getString(1);
       }
        rs.close();
      smt.close();
      con.close();
      if(result==null){result="def";}
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=InvoiceMenu.java  method=getInvoiceFormat(String usercid_adminid) count="+result+" ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=InvoiceMenu.java , method=getInvoiceFormat(String usercid_adminid)-----\n"
    + "\nLINE=105 \n SELECT invoiceformat FROM admindefaultvalues  where useradminid="+usercid_adminid+"     ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
        return result;}
       
            public static String statusInvoicePaidColor(String colortype){
    String color="";
    
     if("0".equalsIgnoreCase(colortype)||"0.0".equalsIgnoreCase(colortype)){return "success";}
       if(colortype!="0"||colortype!="0.0"){return "danger";}
    else { return "";}
    }
            
        public static String getTotalQuantityProductSold(String usercid_adminid,String stockid) throws IOException{
   int count='0';String result="0";
         
      
        try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("SELECT sum(quantity) FROM invoiceproductlog where useradminid=? and stockid=? and type=?  ");
      smt.setString(1,usercid_adminid);
       smt.setString(2,stockid); 
        smt.setString(3,"remove"); 
       ResultSet rs=smt.executeQuery();
        int i=1,j=1;
        while(rs.next()){
           result=rs.getString(1);
       }
        rs.close();
      smt.close();
      con.close();
      if(result==null){result="0";}
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=InvoiceMenu.java  method=getTotalQuantityProductSold(String usercid_adminid,String stockid) count="+result+" ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=InvoiceMenu.java , method=getTotalQuantityProductSold(String usercid_adminid,String stockid)-----\n"
    + "\nLINE=142 \n SELECT sum(quantity) FROM invoiceproductlog where useradminid="+usercid_adminid+"  and stockid="+stockid+"  and type=remove     ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
        return result;}
        
      public static String getCountInvoiceProductSold(String usercid_adminid,String stockid) throws IOException{
   int count='0';String result="0";
         
      
        try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("SELECT count(distinct(businessinvoiceid)) FROM invoiceproductlog where useradminid=? and stockid=? and type=?  ");
      smt.setString(1,usercid_adminid);
       smt.setString(2,stockid); 
        smt.setString(3,"remove"); 
       ResultSet rs=smt.executeQuery();
        int i=1,j=1;
        while(rs.next()){
           result=rs.getString(1);
       }
        rs.close();
      smt.close();
      con.close();
      if(result==null){result="0";}
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=InvoiceMenu.java  method=getCountInvoiceProductSold(String usercid_adminid,String stockid) count="+result+" ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=InvoiceMenu.java , method=getCountInvoiceProductSold(String usercid_adminid,String stockid)-----\n"
    + "\nLINE=173 \n SELECT count(distinct(businessinvoiceid)) FROM invoiceproductlog where useradminid="+usercid_adminid+"  and stockid="+stockid+"  and type=remove     ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
        return result;}
    
      public static  ArrayList<String> getDistinctSoldProductYear(String useradminid,String stockid) throws IOException{
       
     
  ArrayList<String> list=new ArrayList<String>();//Creating arraylist  
     
     try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement(" select distinct year(timestamp)year1 from invoiceproductlog where useradminid=? and stockid=? and type=? ORDER BY year1 DESC ");
      
        smt.setString(1,useradminid);
        smt.setString(2,stockid);
        smt.setString(3,"remove");
      
        ResultSet rs=smt.executeQuery();
        int i=1,j=1;
        while(rs.next()){
               list.add(rs.getString(1)); 
       }
          rs.close();
      smt.close();
      con.close();
      Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=InvoiceMenu.java  method=getDistinctSoldProductYear(String useradminid,String stockid) ");
     
       }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=InvoiceMenu.java , method=getDistinctSoldProductYear(String useradminid,String stockid)-----\n"
    + "\nLINE=206 \n select distinct year(timestamp)year1 from invoiceproductlog where useradminid="+useradminid+" and stockid="+stockid+" and type=remove ORDER BY year1 DESC    ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
     return list;
     
     } 
  public static int[][] getProductSoldMonthlyCountByYear(String usercid_adminid,String stockid,String year) throws IOException{
 int [][] data=new int[13][3];
  int i=1,j=1;
  for(i=1;i<=12;++i)
  {
  data[i][1]=i;
  data[i][2]=0;
  }
  try{ 
       Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement(" SELECT month(timestamp)month , SUM(quantity)quantity  FROM invoiceproductlog  where useradminid=? and stockid=? and type=? and"
                + "YEAR(timestamp)=?  GROUP BY month(timestamp)   ");
      
        smt.setString(1,usercid_adminid);
         smt.setString(2,stockid);
        smt.setString(3,year);
       ResultSet rs=smt.executeQuery();
       i=1;j=1;
        while(rs.next()){
         data[rs.getInt(1)][2]=rs.getInt(2);
       }
          rs.close();
      smt.close();
      con.close();
    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=InvoiceMenu.java  method=getProductSoldMonthlyCountByYear(String usercid_adminid,String stockid,String year)  ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=InvoiceMenu.java , method=getProductSoldMonthlyCountByYear(String usercid_adminid,String stockid,String year)-----\n"
    + "\nLINE=241 \n SELECT month(timestamp)month , SUM(quantity)quantity  FROM invoiceproductlog  where useradminid="+usercid_adminid+" and stockid="+stockid+" and type=remove and  "
                + " YEAR(timestamp)="+year+"  GROUP BY month(timestamp)    ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
   EmergencyEmail.send(e,errormsg); 
                } 
 return data;}
  
   public static String[][] getMyAllMonthlyExpenseDetail(String usercid_adminid,String usercid_id,int n,String datestring) throws IOException{
       String result="0";
       String [][] data=new String [n+1][32];
       
       String fromdate=datestring+"01 00:00:00.001";
       String todate=datestring+"31 23:59:59";
        try{ 
           
        Connection con=Poul.getConnectionCRM();
         PreparedStatement smt=con.prepareStatement("SELECT * FROM expense where useradminid=? and usercid=? and expensedate between ? and  ?  ");
      
        smt.setString(1,usercid_adminid);
         smt.setString(2,usercid_id);
        smt.setString(3,fromdate);
        smt.setString(4,todate);
      ResultSet rs=smt.executeQuery();
        int i=1,j=1;
        while(rs.next()){
            for(j=1;j<=31;j++){
               data[i][j]=(rs.getString(j)); 
            }
            i++;
               
        }
       
          rs.close();
      smt.close();
      con.close();
      
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=Expense.java  method=getMyAllMonthlyExpenseDetail(String usercid_adminid,String usercid_id,int n)  ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Expense.java , method=getMyAllMonthlyExpenseDetail(String usercid_adminid,String usercid_id,int n)-----\n"
     + "\nLINE=201 \n SELECT * FROM expense where useradminid="+usercid_adminid+" and usercid="+usercid_id+" and timestamp between "+fromdate+" and  "+todate+"    ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
       
        return data;
      
     }
     public static String[] getInvoiceBankDetails(String usercid_adminid,String usercid_id,String city) throws IOException{
       String result="0";
       String [] data=new String [6];
       
      try{ 
           
        Connection con=Poul.getConnectionCRM();
         PreparedStatement smt=con.prepareStatement("SELECT bankname,bankacno,bankadd,bankifsc FROM mastertable where useradminid=? and esi_city=?  ");
      
        smt.setString(1,usercid_adminid);
         smt.setString(2,city);
        
      ResultSet rs=smt.executeQuery();
        int i=1,j=1;
        while(rs.next()){
            
               data[1]=(rs.getString(1)); 
           data[2]=(rs.getString(2));
               data[3]=(rs.getString(3));
               data[4]=(rs.getString(4));
        }
       
          rs.close();
      smt.close();
      con.close();
      
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=InvoiceMenu.java  method=getInvoiceBankDetails(String usercid_adminid,String usercid_id,String city)  ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=InvoiceMenu.java , method=getInvoiceBankDetails(String usercid_adminid,String usercid_id,String city)-----\n"
     + "\nLINE=319 \n SELECT bankname,bankacno,bankadd,bankifsc FROM mastertable where useradminid="+usercid_adminid+" and esi_city="+city+"     ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
       
        return data;
      
     }
}
