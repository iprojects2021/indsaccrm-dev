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
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import log.Log;

/**
 *
 * @author Dell
 */
public class Expense {
     public static String statusExpenseColor(String taskstatus){
    String color="";
    if("Unsettled".equalsIgnoreCase(taskstatus)){return "danger";}
    if("Settled".equalsIgnoreCase(taskstatus)){return "success";}
   
    else { return "";}
    }
        public static int getAllDistinctCategoryCount(String useradminid) throws IOException{
         int n1=0; String count="0";
        try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(category) from expense where useradminid=?");
      
        smt.setString(1,useradminid);
        ResultSet rs=smt.executeQuery();
        
        while(rs.next()){
            
               count=(rs.getString(1)); 
               
        }
          rs.close();
      smt.close();
      con.close();
        n1=Integer.parseInt(count);
           Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=Expense.java  method=getAllDistinctCategoryCount(String useradminid) count="+n1+"");
  
       }
        catch(Exception e){
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Expense.java , method=getAllDistinctCategoryCount(String useradminid)-----\n"
    + "\nLINE=58 \n select count(category) from expense where useradminid=="+useradminid+"  ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
        return n1;
    
    }
     public static  ArrayList<String> getAllDistinctCategory(String useradminid) throws IOException{
       
     
  ArrayList<String> list=new ArrayList<String>();//Creating arraylist  
     
     try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select distinct(category) from expense where useradminid=? and category NOT IN (?, ?, ?,?)");
      
        smt.setString(1,useradminid);
        smt.setString(2,"Automobile Expense");
        smt.setString(3,"Office Supplies");
        smt.setString(4,"Telephone Expense");
        smt.setString(5,"Employee Expense");
        ResultSet rs=smt.executeQuery();
        int i=1,j=1;
        while(rs.next()){
               list.add(rs.getString(1)); 
       }
          rs.close();
      smt.close();
      con.close();
      Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=Expense.java  method=getAllDistinctCategory(String useradminid,int n1) ");
     
       }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Expense.java , method=getAllDistinctCategory(String useradminid,int n1)-----\n"
    + "\nLINE=93 \n select distinct(category) from expense where useradminid="+useradminid+"    ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
     return list;
     
     } 
     
      public static String getMonthlyExpense(String usercid_adminid,String usercid_id,String month,String year) throws IOException{
       String result="0";
        try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("SELECT SUM(expenseamount) FROM expense where useradminid=? and  usercid=? and month(expensedate)=?  and  year(expensedate)=?  ");
      
        smt.setString(1,usercid_adminid);
        smt.setString(2,usercid_id);
        smt.setString(3,month);
       smt.setString(4,year);
        ResultSet rs=smt.executeQuery();
        int i=1,j=1;
        while(rs.next()){
           result=rs.getString(1);
       }
       
          rs.close();
      smt.close();
      con.close();
      if(result==null){result="0";}
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=Expense.java  method=getMonthlyExpense("+usercid_adminid+","+usercid_id+","+month+","+year+")  ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Expense.java , method=getMonthlyExpense(String usercid_adminid,String usercid_id,String month,String year)-----\n"
    + "\nLINE=126 \n SELECT SUM(expenseamount) FROM expense where useradminid="+usercid_adminid+" and  usercid="+usercid_id+" and month(timestamp)="+month+"  and  year(timestamp)= "+year+"    ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
        return result;
      
     }
       public static String getMyStatusExpenseAmount(String usercid_adminid,String usercid_id,String status) throws IOException{
       String result="0";
       
        try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("SELECT SUM(expenseamount) FROM expense where useradminid=? and usercid=? and status=?  ");
      
        smt.setString(1,usercid_adminid);
        smt.setString(2,usercid_id);
        smt.setString(3,status);
     
       
        ResultSet rs=smt.executeQuery();
        int i=1,j=1;
        while(rs.next()){
           result=rs.getString(1);
       }
       
          rs.close();
      smt.close();
      con.close();
      if(result==null){result="0";}
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=Expense.java  , method=getMyStatusExpenseAmount(String usercid_adminid,String usercid_id,String status) result="+result+"  ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Expense.java , method=getMyStatusExpenseAmount(String usercid_adminid,String usercid_id,String status)-----\n"
    + "\nLINE=160 \n SELECT SUM(expenseamount) FROM expense where useradminid="+usercid_adminid+" and status=Unsettled   ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
       return result;
      
     }     
     
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
        public static int getMyAllMonthlyExpenseCount(String usercid_adminid,String usercid_id,String datestring) throws IOException
        { int count='0';String result="0";
         
       
       String fromdate=datestring+"01 00:00:00.001";
       String todate=datestring+"31 23:59:59";
        try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("SELECT count(id) FROM expense where useradminid=? and usercid=? and expensedate between ? and  ?  ");
      
        smt.setString(1,usercid_adminid);
         smt.setString(2,usercid_id);
        smt.setString(3,fromdate);
        smt.setString(4,todate);
       
        ResultSet rs=smt.executeQuery();
        int i=1,j=1;
        while(rs.next()){
           result=rs.getString(1);
       }
       
          rs.close();
      smt.close();
      con.close();
      if(result==null){result="0";}
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=Expense.java  method=getMyAllMonthlyExpenseCount(String usercid_adminid,String usercid_id) count="+result+" ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Expense.java , method=getMyAllMonthlyExpenseCount(String usercid_adminid,String usercid_id)-----\n"
    + "\nLINE=239 \n SELECT count(id) FROM expense where useradminid="+usercid_adminid+" and usercid="+usercid_id+" and timestamp between "+fromdate+" and  "+todate+"    ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
        return Integer.parseInt(result);
        }
        
 public static String saveExpenseReceipttoDB(String useradminid,String usercid,String id,String filename,String expensedate) throws IOException{
        
       try{
     Connection c=Poul.getConnectionCRM();

Statement st=c.createStatement(); 
     st.addBatch("update expense set   uploadfile='"+filename+"'  where id='"+id+"' and useradminid='"+useradminid+"' ");
 ResultSet rs3;
     rs3 = st.executeQuery("select  max(id)  FROM expenselog  ");
  String SR="0";
      while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
          int  i = Integer.parseInt( SR ); 
           ++i;  
           java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());
        
        java.sql.Timestamp expensedatee=java.sql.Timestamp.valueOf(expensedate);
        
       String logstatus="Receipt Upload";
             st.addBatch("insert into expenselog values('"+i+"','"+sqlTime+"','','','"+expensedatee+"','','','','"+useradminid+"','"+usercid+"','"+id+"','','','"+logstatus+"','"+filename+"','','','','','','','','','','','','','','','','','','')");
       
     st.executeBatch(); 
    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  ,File=Expense.java method=saveExpenseReceipttoDB() ,useradminid="+useradminid+" ,usercid="+usercid+",filename="+filename+",id="+id+", Expense Receipt Saved to DB Successfully");
       
      st.close();
      c.close();    }
        catch(SQLException e)
        {
      String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n Package=menu , File=Expense.java , method=saveExpenseReceipttoDB(String useradminid,String usercid,String id,String filename)-----\n"
     + "LINE=280 \n update expense set   uploadfile='"+filename+"'  where id='"+id+"' and useradminid='"+useradminid+"'  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
     
        }
    return "true";}
 
 public static  ArrayList<String> getDistinctExpenseYear(String useradminid,String usercid) throws IOException{
       
     
  ArrayList<String> list=new ArrayList<String>();//Creating arraylist  
     
     try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select distinct year(expensedate) year1 from expense where useradminid=? and usercid=?"
                + " union select distinct year(timestamp)year1 from expense where useradminid=? and usercid=? ORDER BY year1 DESC ");
      
        smt.setString(1,useradminid);
        smt.setString(2,usercid);
        smt.setString(3,useradminid);
        smt.setString(4,usercid);
        ResultSet rs=smt.executeQuery();
        int i=1,j=1;
        while(rs.next()){
               list.add(rs.getString(1)); 
       }
          rs.close();
      smt.close();
      con.close();
      Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=Expense.java  method=getAllDistinctCategory(String useradminid,int n1) ");
     
       }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Expense.java , method=getAllDistinctCategory(String useradminid,int n1)-----\n"
    + "\nLINE=315 \n select distinct(category) from expense where useradminid="+useradminid+"    ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
     return list;
     
     } 
 
 public static int getMyApprovalStatusExpensesCount(String usercid_adminid,String usercid_id,String approvalstatus) throws IOException
        { int count='0';String result="0";
      
        try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("SELECT count(id) FROM expense where useradminid=? and reportto=? and approvalstatus=?  ");
      
        smt.setString(1,usercid_adminid);
         smt.setString(2,usercid_id);
        smt.setString(3,approvalstatus);
     
       
        ResultSet rs=smt.executeQuery();
        int i=1,j=1;
        while(rs.next()){
           result=rs.getString(1);
       }
       
          rs.close();
      smt.close();
      con.close();
      if(result==null){result="0";}
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=Expense.java  method=getMyApprovalStatusExpensesCount(String usercid_adminid,String usercid_id,String approvalstatus) count="+result+" ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Expense.java , method=getMyApprovalStatusExpensesCount(String usercid_adminid,String usercid_id,String approvalstatus)-----\n"
    + "\nLINE=350 \n SELECT count(id) FROM expense where useradminid="+usercid_adminid+" and usercid="+usercid_id+" and and approvalstatus="+approvalstatus+"    ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
        return Integer.parseInt(result);
        }
 
 public static int[][] getExpenseDailyCountByMonth(String usercid_adminid,String usercid_id,String month,String year) throws IOException{
 int [][] data=new int[32][3];
  int i=1,j=1;
  for(i=1;i<=31;++i)
  {
  data[i][1]=i;
  data[i][2]=0;
  }
     try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("SELECT day(expensedate) day, SUM(expenseamount) Expense FROM expense where useradminid=? and usercid=? and "
                + "YEAR(expensedate)=? and month(expensedate)=? GROUP BY day(expensedate)   ");
      
        smt.setString(1,usercid_adminid);
         smt.setString(2,usercid_id);
        smt.setString(3,year);
       smt.setString(4,month);
       
        ResultSet rs=smt.executeQuery();
       i=1;j=1;
        while(rs.next()){
            
         data[rs.getInt(1)][2]=rs.getInt(2);
           
          
       }
       
          rs.close();
      smt.close();
      con.close();
     
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=Expense.java  method=getMyAllMonthlyExpenseCount(String usercid_adminid,String usercid_id) year="+year+" and month="+month+" ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Expense.java , method=getExpenseDailyCountByMonth(String usercid_adminid,String usercid_id)-----\n"
    + "\nLINE=393 \n SELECT day(expensedate) day, COUNT(*) COUNT  FROM expense where useradminid="+usercid_adminid+" and usercid="+usercid_id+" and YEAR(expensedate)="+year+" and month(expensedate)="+month+" GROUP BY day(expensedate)    ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
 
 
 return data;}
 
 public static int getMyAllStatusExpenseCount(String usercid_adminid,String usercid_id,String status) throws IOException
        { int count='0';String result="0";
         
      
        try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("SELECT count(id) FROM expense where useradminid=? and usercid=? and status=?  ");
      
        smt.setString(1,usercid_adminid);
         smt.setString(2,usercid_id);
         smt.setString(3,status);
       
        ResultSet rs=smt.executeQuery();
        int i=1,j=1;
        while(rs.next()){
           result=rs.getString(1);
       }
       
          rs.close();
      smt.close();
      con.close();
      if(result==null){result="0";}
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=Expense.java  method=getMyAllStatusExpenseCount(String usercid_adminid,String usercid_id,String status) count="+result+" ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Expense.java , method=getMyAllStatusExpenseCount(String usercid_adminid,String usercid_id,String status)-----\n"
    + "\nLINE=428 \n SELECT count(id) FROM expense where useradminid="+usercid_adminid+" and usercid="+usercid_id+" and status="+status+"    ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
        return Integer.parseInt(result);
        }
 
 public static String[][] getMyAllStatusExpenseDetail(String usercid_adminid,String usercid_id,int n,String status) throws IOException{
       String result="0";
       String [][] data=new String [n+1][32];
       
       
        try{ 
           
        Connection con=Poul.getConnectionCRM();
         PreparedStatement smt=con.prepareStatement("SELECT * FROM expense where useradminid=? and usercid=? and status=?   ");
      
        smt.setString(1,usercid_adminid);
         smt.setString(2,usercid_id);
        smt.setString(3,status);
        
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
      
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=Expense.java  method=getMyAllStatusExpenseDetail(String usercid_adminid,String usercid_id,int n,String status)  ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Expense.java , method=getMyAllStatusExpenseDetail(String usercid_adminid,String usercid_id,int n,String status)-----\n"
     + "\nLINE=467 \n SELECT * FROM expense where useradminid="+usercid_adminid+" and usercid="+usercid_id+" and status="+status+"   ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
       
        return data;
      
     }

 public static String getMyApprovalStatusExpenseAmount(String usercid_adminid,String usercid_id,String approvalstatus) throws IOException{
       String result="0";
       
        try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("SELECT SUM(expenseamount) FROM expense where useradminid=? and usercid=? and approvalstatus=?  ");
      
        smt.setString(1,usercid_adminid);
        smt.setString(2,usercid_id);
        smt.setString(3,approvalstatus);
     
       
        ResultSet rs=smt.executeQuery();
        int i=1,j=1;
        while(rs.next()){
           result=rs.getString(1);
       }
       
          rs.close();
      smt.close();
      con.close();
      if(result==null){result="0";}
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=Expense.java  , method=getMyApprovalStatusExpenseAmount(String usercid_adminid,String usercid_id,String approvalstatus) result="+result+"  ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Expense.java , method=getMyApprovalStatusExpenseAmount(String usercid_adminid,String usercid_id,String approvalstatus)-----\n"
    + "\nLINE=503\n SELECT SUM(expenseamount) FROM expense where useradminid="+usercid_adminid+" and status=Unsettled   ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
       return result;
      
     }   
  public static int getMyAllApprovalStatusExpenseCount(String usercid_adminid,String usercid_id,String spprovalstatus) throws IOException
        { int count='0';String result="0";
         
      
        try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("SELECT count(id) FROM expense where useradminid=? and reportto=? and approvalstatus=?  ");
      
        smt.setString(1,usercid_adminid);
         smt.setString(2,usercid_id);
         smt.setString(3,spprovalstatus);
       
        ResultSet rs=smt.executeQuery();
        int i=1,j=1;
        while(rs.next()){
           result=rs.getString(1);
       }
       
          rs.close();
      smt.close();
      con.close();
      if(result==null){result="0";}
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=Expense.java  method=getMyAllApprovalStatusExpenseCount(String usercid_adminid,String usercid_id,String approvalstatus) count="+result+" ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Expense.java , method=getMyAllApprovalStatusExpenseCount(String usercid_adminid,String usercid_id,String approvalstatus)-----\n"
    + "\nLINE=537 \n SELECT count(id) FROM expense where useradminid="+usercid_adminid+" and usercid="+usercid_id+" and approvalstatus="+spprovalstatus+"    ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
        return Integer.parseInt(result);
        }
 
 public static String[][] getMyAllApprovalStatusExpenseDetail(String usercid_adminid,String usercid_id,int n,String spprovalstatus) throws IOException{
       String result="0";
       String [][] data=new String [n+1][32];
       
       
        try{ 
           
        Connection con=Poul.getConnectionCRM();
         PreparedStatement smt=con.prepareStatement("SELECT * FROM expense where useradminid=? and reportto=? and approvalstatus=?   ");
      
        smt.setString(1,usercid_adminid);
         smt.setString(2,usercid_id);
        smt.setString(3,spprovalstatus);
        
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
      
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=Expense.java  method=getMyAllStatusExpenseDetail(String usercid_adminid,String usercid_id,int n,String approvalstatus)  ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Expense.java , method=getMyAllStatusExpenseDetail(String usercid_adminid,String usercid_id,int n,String approvalstatus)-----\n"
     + "\nLINE=576 \n SELECT * FROM expense where useradminid="+usercid_adminid+" and usercid="+usercid_id+" and status="+spprovalstatus+"   ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
       
        return data;
      
     }
 public static int[][] getExpenseMonthlyCountByYear(String usercid_adminid,String usercid_id,String year) throws IOException{
 int [][] data=new int[13][3];
  int i=1,j=1;
  for(i=1;i<=12;++i)
  {
  data[i][1]=i;
  data[i][2]=0;
  }
  try{ 
       Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("SELECT month(expensedate) month, SUM(expenseamount) Expense FROM expense where useradminid=? and usercid=? and "
                + "YEAR(expensedate)=?  GROUP BY month(expensedate)   ");
      
        smt.setString(1,usercid_adminid);
         smt.setString(2,usercid_id);
        smt.setString(3,year);
       ResultSet rs=smt.executeQuery();
       i=1;j=1;
        while(rs.next()){
         data[rs.getInt(1)][2]=rs.getInt(2);
       }
          rs.close();
      smt.close();
      con.close();
    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=Expense.java  method=getExpenseMonthlyCountByYear("+usercid_adminid+","+usercid_id+","+year+") year="+year+"  ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Expense.java , method=getExpenseMonthlyCountByYear(String usercid_adminid,String usercid_id,String year)-----\n"
    + "\nLINE=612 \n SELECT month(expensedate) month, SUM(expenseamount) Expense FROM expense where  "
                + " useradminid="+usercid_adminid+" and usercid="+usercid_id+" and YEAR(expensedate)="+year+"  month(expensedate)    ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
   EmergencyEmail.send(e,errormsg); 
                } 
 return data;}
 
 public static int getMyAllMonthlyExpenseCountByDateCreated(String usercid_adminid,String usercid_id,String datestring) throws IOException
        { int count='0';String result="0";
         
      
       String fromdate=datestring+"01 00:00:00.001";
       String todate=datestring+"31 23:59:59";
        try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("SELECT count(id) FROM expense where useradminid=? and usercid=? and timestamp between ? and  ?  ");
      
        smt.setString(1,usercid_adminid);
         smt.setString(2,usercid_id);
        smt.setString(3,fromdate);
        smt.setString(4,todate);
       
        ResultSet rs=smt.executeQuery();
        int i=1,j=1;
        while(rs.next()){
           result=rs.getString(1);
       }
       
          rs.close();
      smt.close();
      con.close();
      if(result==null){result="0";}
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=Expense.java  method=getMyAllMonthlyExpenseCount(String usercid_adminid,String usercid_id) count="+result+" ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Expense.java , method=getMyAllMonthlyExpenseCount(String usercid_adminid,String usercid_id)-----\n"
    + "\nLINE=649 \n SELECT count(id) FROM expense where useradminid="+usercid_adminid+" and usercid="+usercid_id+" and timestamp between "+fromdate+" and  "+todate+"    ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
        return Integer.parseInt(result);
        }
       public static String[][] getMyAllMonthlyExpenseDetailByDateCreated(String usercid_adminid,String usercid_id,int n,String datestring) throws IOException{
       String result="0";
       String [][] data=new String [n+1][32];
       
       String fromdate=datestring+"01 00:00:00.001";
       String todate=datestring+"31 23:59:59";
        try{ 
           
        Connection con=Poul.getConnectionCRM();
         PreparedStatement smt=con.prepareStatement("SELECT * FROM expense where useradminid=? and usercid=? and timestamp between ? and  ?  ");
      
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
      
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=Expense.java  method=getMyAllMonthlyExpenseDetailByDateCreated(String usercid_adminid,String usercid_id,int n)  ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Expense.java , method=getMyAllMonthlyExpenseDetailByDateCreated(String usercid_adminid,String usercid_id,int n)-----\n"
     + "\nLINE=688 \n SELECT * FROM expense where useradminid="+usercid_adminid+" and usercid="+usercid_id+" and timestamp between "+fromdate+" and  "+todate+"    ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
       
        return data;
      
     } 
        public static String getMonthlyExpenseByDateCreated(String usercid_adminid,String usercid_id,String month,String year) throws IOException{
       String result="0";
        try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("SELECT SUM(expenseamount) FROM expense where useradminid=? and  usercid=? and month(timestamp)=?  and  year(timestamp)=?  ");
      
        smt.setString(1,usercid_adminid);
        smt.setString(2,usercid_id);
        smt.setString(3,month);
       smt.setString(4,year);
        ResultSet rs=smt.executeQuery();
        int i=1,j=1;
        while(rs.next()){
           result=rs.getString(1);
       }
       
          rs.close();
      smt.close();
      con.close();
      if(result==null){result="0";}
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=Expense.java  method=getMonthlyExpenseByDateCreated("+usercid_adminid+","+usercid_id+","+month+","+year+")  ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Expense.java , method=getMonthlyExpenseByDateCreated(String usercid_adminid,String usercid_id,String month,String year)-----\n"
    + "\nLINE=721 \n SELECT SUM(expenseamount) FROM expense where useradminid="+usercid_adminid+" and  usercid="+usercid_id+" and month(timestamp)="+month+"  and  year(timestamp)= "+year+"    ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
        return result;
    }
         public static int[][] getExpenseDailyCountByMonthByDateCreated(String usercid_adminid,String usercid_id,String month,String year) throws IOException{
 int [][] data=new int[32][3];
  int i=1,j=1;
  for(i=1;i<=31;++i)
  {
  data[i][1]=i;
  data[i][2]=0;
  }
     try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("SELECT day(timestamp) day, SUM(expenseamount) Expense FROM expense where useradminid=? and usercid=? and "
                + "YEAR(timestamp)=? and month(timestamp)=? GROUP BY day(timestamp)   ");
      
        smt.setString(1,usercid_adminid);
         smt.setString(2,usercid_id);
        smt.setString(3,year);
       smt.setString(4,month);
       
        ResultSet rs=smt.executeQuery();
       i=1;j=1;
        while(rs.next()){
            
         data[rs.getInt(1)][2]=rs.getInt(2);
           
          
       }
       
          rs.close();
      smt.close();
      con.close();
     
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=Expense.java  method=getExpenseDailyCountByMonthByDateCreated(String usercid_adminid,String usercid_id) year="+year+" and month="+month+" ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Expense.java , method=getExpenseDailyCountByMonthByDateCreated(String usercid_adminid,String usercid_id)-----\n"
    + "\nLINE=393 \n SELECT day(expensedate) day, COUNT(*) COUNT  FROM expense where useradminid="+usercid_adminid+" and usercid="+usercid_id+" and YEAR(timestamp)="+year+" and month(timestamp)="+month+" GROUP BY day(timestamp)    ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
 return data;}
         
    public static int getReceiptUploadLogCount(String usercid_adminid,String eid) throws IOException
        { int count='0';String result="0";
       try{ 
       Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("SELECT count(id) FROM expenselog where useradminid=? and eid=? and add1=?  ");
       smt.setString(1,usercid_adminid);
         smt.setString(2,eid);
        smt.setString(3,"Receipt Upload");
       ResultSet rs=smt.executeQuery();
        int i=1,j=1;
        while(rs.next()){
           result=rs.getString(1);
       }
         rs.close();
      smt.close();
      con.close();
      if(result==null){result="0";}
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=Expense.java  method=getMyApprovalStatusExpensesCount(String usercid_adminid,String usercid_id,String approvalstatus) count="+result+" ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Expense.java , method=getMyApprovalStatusExpensesCount(String usercid_adminid,String usercid_id,String approvalstatus)-----\n"
    + "\nLINE=790 \n SELECT count(id) FROM expenselog where useradminid="+usercid_adminid+" and eid="+eid+" and  add=Receipt Upload    ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
        return Integer.parseInt(result);
        }
}
