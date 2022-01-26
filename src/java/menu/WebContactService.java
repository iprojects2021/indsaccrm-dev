/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package menu;

import Resource.WebContact;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class WebContactService {
    
    public static Connection getConnection(){
           Connection con=null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
                
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/indsaccr_development","root","mysql");
	}catch(Exception e){
            
            System.out.println(e);
        }
           return con;
           
       } 
    
    public static boolean saveWebContact(WebContact webContact){
        
        Connection con=WebContactService.getConnection();  
          
            try{
            PreparedStatement ps=con.prepareStatement("insert into webcontactus(firstname,lastname,email,message,status) values (?,?,?,?,?)"); 
            
            ps.setString(1,webContact.getFirstName());
            ps.setString(2,webContact.getLastName());  
            ps.setString(3,webContact.getEmail());  
            ps.setString(4,webContact.getMessage());  
            ps.setString(5,webContact.getStatus());  
            
            ps.executeUpdate(); 
            
              
            }catch(Exception ex){
                ex.printStackTrace();
               
            }
            boolean trueVariable = true;
            if (trueVariable)
            {
              System.out.println("Your data is successfully saved");
            }
            
      
     return true;   
    }
}
