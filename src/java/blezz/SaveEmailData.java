/*What this page does? Creates a connection with database and saves the sent email data in the db , this custom class
 *  called form the SaveEmailtodb.java 
 * What are the varialbes ?
 * pstm var gets a PreparedStatement instance for excuting the sql query
 * sql for storing the sql query
 * methods-(parameter) 
 * saveRecipientData(LocalDateTime now ,String recipient) stores the recipient emails in the  db with timestamp	
 * saveContentData(LocalDateTime now ,String subject,String content,String attachmentdir)//Stores the subject content and attachment dir in the db with timestamp
 * forName("com.mysql.cj.jdbc.Driver");// gets the class for creation of a connection with db
 * getConnection("jdbc:mysql://localhost/test_db","root","08april1993");//creates a connection with db
 * con.setAutoCommit(false);//Sets the autocommit to false so there if any error the data will not be save in the db
 *con.commit();//writes the data in the database 
 * Date Created :10-06-2020
 * Created By:-Tapswi Godara
 * 
 */
package blezz;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import log.Log;


public class SaveEmailData {
	// stores the recipient emails in the  db
	public void saveRecipientData(LocalDateTime now ,String recipient,String usercid_id ,String usercid_adminid,String useremail)
	{
		try{
			//connection to database 
			
			Connection con=Poul.getConnectionCRM();
                        con.setAutoCommit(false);//Sets the autocommit to false so there if any error the data will not be save in the db
			//pstm var gets a PreparedStatement instance for excuting the sql query
			PreparedStatement pstm = null ;
			//sql for storing the sql query 
                        
		    String sql = "insert into sentmail (recipient_email,timestamp,usercid ,useradminid ,fromemail) values('"+recipient+"','"+now+"','"+usercid_id+"','"+usercid_adminid+"','"+useremail+"');";
										pstm = (PreparedStatement) con.prepareStatement(sql);
										pstm.execute();
										
			con.commit();//writes the data in the database 
			pstm.close();
			con.close();
			
		  Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+", sentmailid="+now+",  Package=blezz ,  File=SaveEmailData.java  Method=saveRecipientData()- Saved DB Successfully");
      	
		}
                catch(SQLException ex){
			System.out.println(ex);
			
		}
	}

		public void saveContentData(LocalDateTime now ,String subject,String content,String attachmentdir,String usercid_id ,String usercid_adminid,String useremail)
		{
			try{
				//connection to database 
							Connection con=Poul.getConnectionCRM();
				con.setAutoCommit(false);
				PreparedStatement pstm = null ;
			    String sql = "insert into sentmailcontent (timestamp,subject,content,attachmentdir,usercid ,useradminid ,fromemail) values('"+now+"','"+subject+"','"+content+"','"+attachmentdir+"','"+usercid_id+"','"+usercid_adminid+"','"+useremail+"');";
											pstm = (PreparedStatement) con.prepareStatement(sql);
											pstm.execute();
											
				con.commit();
				pstm.close();
				con.close();
				
			  Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+",sentmailid="+now+",   Package=blezz ,  File=SaveEmailData.java  Method=saveContentData()- Saved DB Successfully");
      		
			}
                        catch(SQLException ex){
				System.out.println(ex);
				
			}
			
		}
	}


