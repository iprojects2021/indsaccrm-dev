/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tables;

import blezz.Poul;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import log.Log;

/**
 *
 * @author Awesome
 */
public class TableIn {
     
    public String[][] getTable(String datefrom,String dateto,String requestcid)
	{
    
                       
            int ii = 1, jj = 0;
            String count123 = "0";
            Log.writeLog("Enterned TableIn GetTable Method");
            try {
                Connection con = Poul.getConnectionCRM();
                PreparedStatement smt = con.prepareStatement("select count(*) from invoice where customerid=? and b_ between ? and ? ");
                smt.setString(1, requestcid);
                smt.setString(2,datefrom);
                smt.setString(3,dateto);
                ResultSet rs = smt.executeQuery();
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
                PreparedStatement smt = con.prepareStatement("select * from  invoice where customerid=? and b_ between ? and ?");
                smt.setString(1, requestcid);
                smt.setString(2,datefrom);
                smt.setString(3,dateto);
                System.out.println(requestcid+""+datefrom+""+dateto);
                ResultSet rs = smt.executeQuery();

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
    public int getCount(String datefrom,String dateto,String requestcid)
            
	{
            System.out.println("enter get count");
            Log.writeLog("TableIn Enterned GetCount Method");
            String count123 = "0";
            try {
                Connection con = Poul.getConnectionCRM();
                PreparedStatement smt = con.prepareStatement("select count(*) from invoice where customerid=? and b_ between ? and ?");
                smt.setString(1, requestcid);
                smt.setString(2,datefrom);
                smt.setString(3,dateto);
                
                ResultSet rs = smt.executeQuery();
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
