/*What this page does?// Get the selected date range from the jsp file and send it db and the emails for that date range  
 * and send the recieved data to the EmailTable.jsp for displaying the data
 * What are the varialbes 1.datefrom is for storing date in format yyyy-mm-dd
 * 2.dateto is for storing  date in format yyyy-mm-dd
 * 3.date var is reciving the selected date from the jsp page
 * 4.datefrom1 is for storing the first part of the date range after spilting the date var which is starting date of the date range
 * 4.dateto1 is for storing the second part of the date range after spilting the date var which is ending date of the date range 
 * 5.format1 is var for changing the date form the jsp to yyyy-mm-dd
 * 6.date1 is for converting the string datefrom1 into date var
 * 7.date2 is for converting the string dateto1 into date var
 * 8.data is list var for getting the email data form the database
 * ->methods-(parameter) no methods
 * 1.request.getParameter for getting the date range form the EmailTable.jsp
 *  2.date.split("\\- ")[1];// for splitting the date var in two parts which contains full date range ,
                                              //this will give second  part of the date range
 * 3.date.split("\\ -")[0]; // for splitting the date var in two parts which contains full date range ,this will give first part of the date range
 * 4.parse(dateto1);// for converting the string date into the date var
 * 5.format(date2);// for converting the date var into the yyyy-mm-dd which is requored in db for getting the data
 * 6.getData(dateform,dateto);//for getting the data form the database custom method of database dao class
 * 7.setAttribute("data",data);//for sending the var data with emails to the jsp for showing it in the table for selection and sending mail
 * 8.getRequestDispatcher("/EmailTable.jsp");//sending the control to the jsp page 
 * 9.rd.forward(request, response);//for sending the data which set in this servlet
 * Date Created :10-06-2020
 * Created By:-Tapswi Godara
 * 
 */
package blezz;

import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import blezz.DatabaseDao;
import blezz.ModelDatabase;


@WebServlet("/showtable")
public class ShowData extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            		HttpSession session = request.getSession();

      // getting the data form the dao java  
		String datefrom ="";
		String dateto = "";

		String date = request.getParameter("datepicker");// for getting the date range form jsp page
                String customerType = request.getParameter("customerType");
		String datefrom1 = date.split("\\ -")[0]; // for splitting the date var in two parts which contains full date range ,
	                                             //this will give first part of the date range
		String dateto1 = date.split("\\- ")[1];// for splitting the date var in two parts which contains full date range ,
                                              //this will give second  part of the date range

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date1;
		try {
			date1 = (Date) new SimpleDateFormat("MM/dd/yyyy").parse(datefrom1);// for converting the string date into the date var
			 datefrom = format1.format(date1);// for converting the date var into the yyyy-mm-dd which is requored in db for getting the data
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		Date date2;
		try {
			date2 = (Date) new SimpleDateFormat("MM/dd/yyyy").parse(dateto1);// for converting the string date into the date var

			 dateto = format1.format(date2);// for converting the date var into the yyyy-mm-dd which is requored in db for getting the data
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		System.out.println(datefrom+""+dateto);
		//String customerType= (String) session.getAttribute("customerType");
		//List<ModelDatabase> data = DatabaseDao.getData(datefrom,dateto,customerType);//for getting the data form the database custom method of database dao class
		//request.setAttribute("data",data);//for sending the var data with emails to the jsp for showing it in the table for selection and sending mail
		request.setAttribute("datefrom",datefrom);
                request.setAttribute("dateto",dateto);
                request.setAttribute("customerType",customerType);
		//forwarding the data to jsp
		RequestDispatcher rd = request.getRequestDispatcher("/EmailTable.jsp");//sending the control to the jsp page 
		rd.forward(request, response);//for sending the data which set in this servlet
			
}
	
}
