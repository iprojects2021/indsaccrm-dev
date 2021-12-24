/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tables;

import blezz.Poul;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import log.Log;

/**
 *
 * @author Awesome
 */
public class TablePQP {
     
    public String[][] getTable(String datefrom,String dateto,String requestcid,String invoicetype)
	{
    
                       
            int ii = 1, jj = 0;
            String count123 = "0";
            Log.writeLog("Enterned TablePQP GetTable Method");
            try {
                Connection con = Poul.getConnectionCRM();
                Statement smt=con.createStatement();
                ResultSet  rs = smt.executeQuery("select count(*) from "+invoicetype+" where customerid="+requestcid+" and b_ between '"+datefrom+"' and '"+dateto+"' ");
               
                while (rs.next()) {
                    count123 = rs.getString(1);
                }
                rs.close();
                smt.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            int n123 = Integer.parseInt(count123);
            String leaddata[][] = new String[n123 + 1][256];
            try {
                Connection con = Poul.getConnectionCRM();
                Statement smt=con.createStatement();
                ResultSet  rs = smt.executeQuery("select * from "+invoicetype+" where customerid="+requestcid+" and b_ between '"+datefrom+"' and '"+dateto+"' ");
                System.out.println(requestcid+""+datefrom+""+dateto);
               
                while (rs.next()) {   
                    for (jj = 1; jj < 255; jj++) {
                        leaddata[ii][jj] = rs.getString(jj);
                    }
                    ++ii;
                }
                rs.close();
                smt.close();
                con.close();
                System.out.println("Exit get table");
                        return leaddata;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }

       
       
        }
    public int getCount(String datefrom,String dateto,String requestcid,String invoicetype)
            
	{
            System.out.println("enter get count");
            Log.writeLog("TablePQP Enterned GetCount Method");
            String count123 = "0";
            try {
                Connection con = Poul.getConnectionCRM();
                Statement smt=con.createStatement();
                ResultSet  rs = smt.executeQuery("select count(*) from "+invoicetype+" where customerid = "+requestcid+" and b_ between '"+datefrom+"' and '"+dateto+"' ");
               System.out.println("select count(*) from "+invoicetype+" where customerid="+requestcid+" and b_ between "+datefrom+" and "+dateto+" ");
                while (rs.next()) {
                    count123 = rs.getString(1);
                }
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
