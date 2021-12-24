/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package blezz;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import log.Log;

/**
 *
 * @author Sachin
 */
public class InvoiceInsert {
  
    
    public static int setInvoiceInsert(String useradminid,String usercid_id,String contact,String owner){
 try{  java.util.Date ddate=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(ddate.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(ddate.getTime());
      ResultSet rs3; String def[]=new String[8]; String gst="",alterphone="";
     String SR="";String company="",name="",mobile="",email="",website="",add1="",add2="",add3="",city="",pincode="",state="",country="";
      def[1]="0";def[2]="0";def[3]="0";def[4]="0";
          def[5]="0";def[6]="0";def[7]="0";
          String heading="",line1="",line2="",line3="",line4="", note="";
           String bank1="",bank2="",bank3="",bank4="";
       Connection c=Poul.getConnectionCRM();

Statement st=c.createStatement();
        rs3 = st.executeQuery("SELECT * FROM mastertable where useradminid='"+useradminid+"' and esi_city in (select invoicedefaultcity as esi_city from defaultvalues where useradminid='"+useradminid+"' and usercid='"+usercid_id+"') ");
    while(rs3.next())
        
          {
          def[1]=rs3.getString(4);def[2]=rs3.getString(5);def[3]=rs3.getString(6);def[4]=rs3.getString(7);
          def[5]=rs3.getString(8);def[6]=rs3.getString(9);def[7]=rs3.getString(10);
          company=rs3.getString(12);name=rs3.getString(13)+" "+rs3.getString(14);
          gst=rs3.getString(15);website=rs3.getString(16);mobile=rs3.getString(17);alterphone=rs3.getString(18);
          email=rs3.getString(19);add1=rs3.getString(20);add2=rs3.getString(21);add3=rs3.getString(22);
          city=rs3.getString(23);pincode=rs3.getString(24);state=rs3.getString(25);country=rs3.getString(26);
        heading=rs3.getString(31);line1=rs3.getString(32);line2=rs3.getString(33);line3=rs3.getString(34);line4=rs3.getString(35);note=rs3.getString(37);
        bank1=rs3.getString(39);
        bank2=rs3.getString(40);
        bank3=rs3.getString(41);
        bank4=rs3.getString(42);
 }
    String seller="",termcondition="",lines="";
    seller=company+"\n"+name+","+add1+"\n"+add2+" "+add3+"\n"+city+" "+state+" "+country+" "+pincode+"\n"+mobile+" "+alterphone+" "+"Email "+email+"\nGST "+gst+" Web "+website;
    lines=line1+"\n"+line2+"\n"+line3+"\n"+line4;
    String businessinvoiceno="";
    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"   Mastertable city="+city);
      
    rs3 = st.executeQuery("select  businessinvoiceno  FROM invoice where c_='1' and useradminid='"+useradminid+"'  ");
    while(rs3.next())
        
          {businessinvoiceno=rs3.getString(1); }
    if(businessinvoiceno==null||businessinvoiceno==""){businessinvoiceno="0";}
   int j=Integer.parseInt( businessinvoiceno );
   System.out.println("Before businesinvoiceno:"+businessinvoiceno);
   j++;
        businessinvoiceno=Integer.toString(j);
         System.out.println("after businesinvoiceno:"+businessinvoiceno);
 Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"   businessinvoiceno="+businessinvoiceno);
    
               rs3 = st.executeQuery("select  max(id)   FROM invoice  ");
    while(rs3.next())
        
          {SR=rs3.getString(1); }
     int i = Integer.parseInt( SR ); 
           ++i;   
           System.out.println("Second"+def[1]);
       
 st.addBatch("insert into invoice values('"+i+"','"+sqlTime+"','0','"+owner+"','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','0','0','00.00','"+def[2]+"','','"+def[3]+"','','"+def[4]+"','','"+def[5]+"','"+def[6]+"','','"+def[7]+"','','0','','','','','"+contact+"','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','0','"+seller+"','','"+heading+"','"+lines+"','"+note+"'," + "'"+useradminid+"'," + "'"+usercid_id+"'," + "'"+contact+"',"+ "'"+businessinvoiceno+"')");          
      int incid=i;
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"   Invoice insert id="+incid);
       
   System.out.println("Third");
 st.executeBatch();
   System.out.println("four");
 rs3 = st.executeQuery("select  max(id)  FROM invoiceseller  ");
    System.out.println("five");
 while(rs3.next())
        
          {SR=rs3.getString(1); }
      i = Integer.parseInt( SR ); 
           ++i; 
           SR=Integer.toString(i);  System.out.println("si+"+SR);
      st.addBatch("insert into invoiceseller values('"+i+"','"+sqlTime+"','"+useradminid+"','"+usercid_id+"','"+incid+"','','','','','','','"+company+"','"+name+"','','"+gst+"','"+website +"','"+mobile +"','"+alterphone +"','"+email  +"','"+add1  +"','"+add2  +"','"+add3  +"','"+city+"','"+pincode +"','"+state +"','"+country+"','','','','','"+heading +"','"+line1 +"','"+line2 +"','"+line3 +"','"+line4+"','','"+note+"','','"+bank1+"','"+bank2+"','"+bank3+"','"+bank4+"','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','')");          
     
     System.out.println("serven");     
       st.executeBatch();
         System.out.println("eight");
 rs3.close();
      st.close();
      c.close();
 
 }catch(Exception e){e.printStackTrace();}
    return 1;
    }
    
}
