/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tables;
import log.Log;
import blezz.Poul;
import java.time.LocalDateTime;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.sql.ResultSet;
import java.sql.Statement;
/**
 * 
 * @author Awesome
 */
public class CLVTable {
    
    
    
    public String[][] getTable(String datefrom,String dateto,String usercid_id ,String usercid_adminid,String customerType,String status)
	{
    
                    int ii=1,jj=0;
                    String count123="0";    
                     System.out.println("enterned GetTable");
                     Log.writeLog("Enterned CLVTable GetTable Method");
                    try
                    { 
                        Connection con=Poul.getConnectionCRM();
                        PreparedStatement smt=con.prepareStatement("select count(useradminid) from contact where useradminid=? AND customertype=? and status=? and timestamp between ? and ?  ");
                        smt.setString(1,usercid_adminid);
                        smt.setString(2,customerType);
                        smt.setString(3,status);
                        smt.setString(4,datefrom);
                        smt.setString(5,dateto);
                        
                        ResultSet rs=smt.executeQuery();
                        while(rs.next())
                        {  count123=rs.getString(1);  }
                        rs.close();
                        smt.close();
                        con.close();
                         System.out.println("Successfully try executed");
                    } 
                    
                    catch(Exception e)
                    { e.printStackTrace(); }
                    int n123=Integer.parseInt(count123);
                    String leaddata[][]=new String[n123+10][50];
                    try
                    { 
                        Connection con=Poul.getConnectionCRM();
                        PreparedStatement smt=con.prepareStatement("select timestamp,company,firstname,lastname,mobile,alternatephone,email1,status,useradminid from contact where useradminid=? AND customertype=? and status=? and timestamp between ? and ?  ");
                        smt.setString(1,usercid_adminid);
                        smt.setString(2,customerType);
                        smt.setString(3,status);
                        smt.setString(4,datefrom);
                        smt.setString(5,dateto);
                        
                        ResultSet rs=smt.executeQuery();
                        while(rs.next())
                        {
                            for(jj=1;jj<10;jj++)
                            {
                                leaddata[ii][jj]=rs.getString(jj);
                                System.out.println("Step 2"+"  "+leaddata[ii][jj]);
                            }
                           ++ii; 
                        }
                        
                        rs.close();
                        smt.close();
                        con.close();
                        
                        System.out.println("Exit get table");
                        return leaddata;
                    } 
                    catch(Exception e)
                    { 
                        e.printStackTrace(); 
                        Log.writeLog("error");
                        return null;
                    }
      
                
       
        }
    public int getCount(String datefrom,String dateto,String usercid_id ,String usercid_adminid,String customerType,String status)
            
	{
            System.out.println("enter get count");
            Log.writeLog("Enterned GetCount Method");
            String count123="0";
            try
                    { 
                        
                        Connection con=Poul.getConnectionCRM();
                        PreparedStatement smt=con.prepareStatement("select count(useradminid) from contact where useradminid=? AND  customertype=? and status=? and timestamp between ? and ? ");
                        smt.setString(1,usercid_adminid);
                        smt.setString(2,customerType);
                        smt.setString(3,status);
                        smt.setString(4,datefrom);
                        smt.setString(5,dateto);
                        ResultSet rs=smt.executeQuery();
                        while(rs.next())
                        {  count123=rs.getString(1);  }
                        rs.close();
                        smt.close();
                        con.close();
                    } 
                    catch(Exception e)
                    { 
                        e.printStackTrace();
                        Log.writeLog("error");
                    }
                    
        int n123=Integer.parseInt(count123);
          return n123;  
        }
}
