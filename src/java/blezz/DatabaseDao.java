/*What this page does?Reads the data from the database stored from the database and stores in the List and returns the data in the List Form
 * What are the varialbes 
 * fromdate contains the starting date of the range 
 * todate contains end date of the range
 * e is var of ModelDatabase for setting and getting the data
 * methods-(parameter) 
 * getData(String from_date, String to_date) for getting the email form the database
 * Getters and setters from ModelDatabase for id ,name,Email 
 * forName("com.mysql.cj.jdbc.Driver");// gets the class for creation of a connection with db
 * getConnection("jdbc:mysql://localhost/test_db","root","08april1993");//creates a connection with db
 * con.setAutoCommit(false);//Sets the autocommit to false so there if any error the data will not be save in the db
 *con.commit();//writes the data in the database 
 * Date Created :10-06-2020
 * Created By:-Tapswi Godara
 * 
 */
package blezz;


import blezz.ModelDatabase;
import email.EmergencyEmail;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import log.Log;



public class DatabaseDao {
	static Connection con = null;
	static ResultSet rs = null; 	
//method read data from database
	public static List<ModelDatabase> getData(String from_date, String to_date, String customerType) throws IOException{  
		List<ModelDatabase> list=new ArrayList<ModelDatabase>(); 

		try{  
//connection with database
			Connection c=Poul.getConnectionCRM();
                        System.out.println(from_date+""+to_date);
			PreparedStatement ps=c.prepareStatement("select * from contact where customertype='"+customerType+"' and timestamp between '"+from_date+"' and '"+to_date+"';");  

			rs=ps.executeQuery();  
			while(rs.next()){
				//saving the data in the list in model class
				ModelDatabase e=new ModelDatabase();
				e.setId(rs.getInt(1));
				e.setName(rs.getString(6));
                                e.setLastName(rs.getString(7));
				e.setEmailId(rs.getString(23));
				list.add(e); 
			}  
			con.close();  
		}catch(Exception ex){
                  String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=blezz---DatabaseDao.java-----\n"
    + "\nLINE=59\nselect * from contact where customertype='="+customerType+" and timestamp between '"+from_date+"' and '"+to_date+" ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+ex);
     EmergencyEmail.send(ex,errormsg); 
                }  
		return list;  


	}
}
