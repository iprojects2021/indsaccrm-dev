/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package blezz;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Sachin
 */
public class MasterInsert {
    
     public static String setMasterInsert(String useradminid,String location){String SR=""; 
 try{ java.util.Date ddate=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(ddate.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(ddate.getTime());
      ResultSet rs3; 
       Connection c=Poul.getConnectionCRM();

Statement st=c.createStatement();
       
   

               rs3 = st.executeQuery("select  id   FROM mastertable ORDER BY id DESC LIMIT 1 ");
    while(rs3.next())
        
          {SR=rs3.getString(1); }
     int i = Integer.parseInt( SR ); 
           ++i; 
           SR=Integer.toString(i);

      st.addBatch("insert into mastertable values('"+i+"','"+sqlTime+"','"+useradminid+"','','','','','','','','','','','','','','','','','','','','"+location+"','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','')");          
                  
       st.executeBatch();
       rs3.close();
      st.close();
      c.close();
        return SR;
        
   
     
  }catch(Exception e){e.printStackTrace();}
   return SR;
    }
    
}
