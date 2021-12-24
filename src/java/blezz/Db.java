/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package blezz;

import email.EmergencyEmail;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import log.Log;

/**
 *
 * @author Sachin
 */
public class Db {
     public static String getBusinessInvoiceNo(String incid) throws IOException{
        String name="";
     try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select businessinvoiceno from invoice where id=?");
      
        smt.setString(1,incid);
        ResultSet rs=smt.executeQuery();
        
        while(rs.next()){
            
               name=(rs.getString(1)); 
               
        }
        rs.close();
      smt.close();
      con.close();
       
       }
        catch(Exception e){
                        String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=blezz , File=Db.java , method=getBusinessInvoiceNo(String incid)\n"
    + "\nLINE=45\nselect businessinvoiceno from invoice where id="+incid+"  ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
        return name;
    
    }
    public static String getEmployeeName(String empid) throws IOException{
        String name="";
     try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select firstname from register where id=?");
      
        smt.setString(1,empid);
        ResultSet rs=smt.executeQuery();
        
        while(rs.next()){
            
               name=(rs.getString(1)); 
               
        }
        rs.close();
      smt.close();
      con.close();
       
       }
        catch(Exception e){
               String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=blezz , File=Db.java , method=getEmployeeName(String empid) -----\n"
    + "\nLINE=74\nselect firstname from register where id="+empid+"  ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
        return name;
    
    } 
    public static int getAllEmployeeCount(String useradminid) throws IOException{
         int n1=0; String count="0";
        try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(id) from register where useradminid=?");
      
        smt.setString(1,useradminid);
        ResultSet rs=smt.executeQuery();
        
        while(rs.next()){
            
               count=(rs.getString(1)); 
               
        }
          rs.close();
      smt.close();
      con.close();
        n1=Integer.parseInt(count);
       }
        catch(Exception e){
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=blezz , File=Db.java , method=getAllEmployeeCount(String useradminid)-----\n"
    + "\nLINE=103\nselect firstname from register where id="+useradminid+"  ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
        return n1;
    
    }
    
     public static String getCustomerType(String customerid,String useradminid) throws IOException{
        String type="";
     try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select customertype from contact where id=? and useradminid=?");
      
        smt.setString(1,customerid);
        smt.setString(2,useradminid);
        ResultSet rs=smt.executeQuery();
        
        while(rs.next()){
            
               type=(rs.getString(1)); 
               
        }
        rs.close();
      smt.close();
      con.close();
       
       }
        catch(Exception e){
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=blezz , File=Db.java , method=getCustomerType(String customerid,String useradminid)-----\n"
    + "\nLINE=134\n select customertype from contact where id="+customerid+" and useradminid="+useradminid+"  ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
     if("customer".equals(type)){type="contact";}
        return type;
    
    } 
    public static String  getTotalRevenueByEvent(String useradminid,String eventname) throws IOException{
         BigDecimal a=new BigDecimal("0");BigDecimal count=new BigDecimal("0");
        try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("SELECT i.bb_ from invoice i INNER JOIN contact c ON c.id=i.customerid and c.source=? and  c.useradminid=?");
      smt.setString(1,eventname);
        smt.setString(2,useradminid);
        ResultSet rs=smt.executeQuery();
        
        while(rs.next()){
            count=new BigDecimal(rs.getString(1));
            a=a.add(count);
        }
          rs.close();
      smt.close();
      con.close();
        
       }
        catch(SQLException e){
               String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=blezz , File=Db.java , method=getTotalRevenueByEvent(String useradminid,String eventname)-----\n"
    + "\nLINE=163\n SELECT i.bb_ from invoice i INNER JOIN contact c ON c.id=i.customerid and c.source="+eventname+" and  c.useradminid=?"+useradminid+"   ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
        return a.toString();
    
    }
    public static int getActiveEventsCount(String useradminid) throws IOException{
         int n1=0; String count="0";
        try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(id) from events where useradminid=? AND status=? OR status=? OR status=?");
      
        smt.setString(1,useradminid);
        smt.setString(2,"Open");
        smt.setString(3,"Follow Up");
        smt.setString(4,"In Process");
        ResultSet rs=smt.executeQuery();
        
        while(rs.next()){
            
               count=(rs.getString(1)); 
               
        }
          rs.close();
      smt.close();
      con.close();
        n1=Integer.parseInt(count);
       }
        catch(Exception e){
                 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=blezz , File=Db.java , method=getActiveEventsCount(String useradminid)-----\n"
    + "\nLINE=195\n select count(id) from events where useradminid="+useradminid+" AND status=Open OR status=Follow Up OR status=In Process   ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
        return n1;
    
    }
    public static int getCustomerFromMarketing(String useradminid,String type) throws IOException{
         int n1=0,n2=0; String customercount="0";String totalcount="0";
        try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(id) from contact where useradminid=? AND customertype=? ");
      
        smt.setString(1,useradminid);
        smt.setString(2,type);
        
        ResultSet rs=smt.executeQuery();
        
        while(rs.next()){
            
               customercount=(rs.getString(1)); 
               
        }
          rs.close();
      smt.close();
      con.close();
        n1=Integer.parseInt(customercount);
       }
        catch(Exception e){
            String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=blezz , File=Db.java , method=getCustomerFromMarketing(String useradminid,String type)-----\n"
    + "\nLINE=226\n select count(id) from contact where useradminid="+useradminid+" AND customertype="+type+"   ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
       
        return n1;
    
    }
    public static int getLeadsFromMarketing(String useradminid,String type) throws IOException{
         int n1=0,n2=0; String customercount="0";String totalcount="0";
        try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(id) from contact where useradminid=? AND customertype=? ");
      
        smt.setString(1,useradminid);
        smt.setString(2,type);
        
        ResultSet rs=smt.executeQuery();
        
        while(rs.next()){
            
               customercount=(rs.getString(1)); 
               
        }
          rs.close();
      smt.close();
      con.close();
        n1=Integer.parseInt(customercount);
       }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=blezz , File=Db.java , method=getLeadsFromMarketing(String useradminid,String type)-----\n"
    + "\nLINE=258\n select count(id) from contact where"+useradminid+" AND customertype="+type+"   ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
       
        return n1;
    
    }
     public static String[][] getAllEmployeeName(String useradminid,int n1) throws IOException{
       
     
     String data[][]=new String [n1+1][5];
     
     try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select id,firstname from register where useradminid=?");
      
        smt.setString(1,useradminid);
        ResultSet rs=smt.executeQuery();
        int i=1,j=1;
        while(rs.next()){
            
            for(j=1;j<=2;j++){
               data[i][j]=(rs.getString(j)); 
            }
            i++;
               
        }
          rs.close();
      smt.close();
      con.close();
       
       }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=blezz , File=Db.java , method=getAllEmployeeName(String useradminid,int n1)-----\n"
    + "\nLINE=294\n select id,firstname from register where useradminid="+useradminid+"    ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
     return data;
     
     } 
    public static String[][] getAllActiveEvents(String useradminid,int n1) throws IOException{
       
     
     String data[][]=new String [n1+1][5];
     
     try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select id,subject from events where useradminid=? AND status=? OR status=? OR status=?");
      
        smt.setString(1,useradminid);
        smt.setString(2,"Open");
        smt.setString(3,"Follow Up");
        smt.setString(4,"In Process");
        ResultSet rs=smt.executeQuery();
        int i=1,j=1;
        while(rs.next()){
            
            for(j=1;j<=2;j++){
               data[i][j]=(rs.getString(j)); 
            }
            i++;
               
        }
          rs.close();
      smt.close();
      con.close();
       
       }
        catch(Exception e){
     String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=blezz , File=Db.java , method=getAllActiveEvents(String useradminid,int n1)-----\n"
    + "\nLINE=332\n select id,subject from events where useradminid="+useradminid+" AND status=Open OR status=followup OR status=inprocess    ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
     return data;
     
     } 
    
    public static String[] getCustomerName(String customerid,String useradminid) throws IOException{
        String [] data=new String[5];
          try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select id,company,firstname,customertype  from contact where id=? and useradminid=?");
      
        smt.setString(1,customerid);
        smt.setString(2,useradminid);
        ResultSet rs=smt.executeQuery();
        
        while(rs.next()){
            
               data[1]=(rs.getString(1)); 
               data[2]=(rs.getString(2));
               data[3]=(rs.getString(3)); 
             data[4]=(rs.getString(4));
        }
          rs.close();
      smt.close();
      con.close();
       }
        catch(Exception e){
    String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=blezz , File=Db.java , method=getCustomerName(String customerid,String useradminid)-----\n"
    + "\nLINE=364\n select id,company,firstname,customertype  from contact where id="+customerid+" and useradminid="+useradminid+"    ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
    return data;}
    
    public static String getEmployeeName(String employeeid,String useradminid) throws IOException{
        String  data="";
          try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select firstname  from register where id=? and useradminid=?");
      
        smt.setString(1,employeeid);
        smt.setString(2,useradminid);
        ResultSet rs=smt.executeQuery();
        
        while(rs.next()){
            
               data=(rs.getString(1)); 
               
        }
          rs.close();
      smt.close();
      con.close();
       }
        catch(Exception e){
       String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=blezz , File=Db.java , method=getEmployeeName(String employeeid,String useradminid)-----\n"
    + "\nLINE=392\n select firstname  from register where id=?"+employeeid+" useradminid="+useradminid+"    ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
    return data;}
    
    public static String[] getValidateUserData(String id,String useradminid) throws IOException{
        String data[]=new String[51];
    try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from validateuser where id=? and useradminid=?");
      
        smt.setString(1,id);
        smt.setString(2,useradminid);
        ResultSet rs=smt.executeQuery();
        
        while(rs.next()){
            for(int i=1;i<=50;i++){
               data[i]=(rs.getString(i)); 
            }
        }
          rs.close();
      smt.close();
      con.close();
       }
        catch(Exception e){
           String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=blezz , File=Db.java , method=getValidateUserData(String id,String useradminid)-----\n"
    + "\nLINE=420\n select * from validateuser where id="+id+"and useradminid="+useradminid+"    ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg);
                } 

    return data;
    
    }
    
}
