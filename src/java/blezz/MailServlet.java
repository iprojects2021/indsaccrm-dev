/*What this page does?//gets the selected emails form the jsp and send it to comppose mail page
 *What are the varialbes
 *1.session for accesing the session in the servlet
 *2.names var for storing the selected emails form the jsp
 *Methods
 * 1.getSession();//for creating the seesion for storing and getting variables form another servlets and jsp
 * 2.getParameterValues("email");//getParameter for getting the date range form the EmailTable.jsp
 * 3.asList(names);//method for converting  the names array into list
 * 4.setAttribute("emails", list);// for setting the list var as attribute to sending it composemail jsp for the showing the recipients
 * 5.getRequestDispatcher("/ComposeMail.jsp");//sending the control to the jsp page
 * 6.forward(request, response);//for sending the data which set in this servlet
 * Date Created :10-06-2020
 * Created By:-Tapswi Godara
 * 
 */
package blezz;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MailServlet
 */
@WebServlet("/Mail")
public class MailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	          HttpSession session = request.getSession();//for creating the seesion for storing and getting variables form another servlets and jsp
	        //session for accesing the session in the servlet
	        String[] names = request.getParameterValues("email");//getParameter for getting the date range form the EmailTable.jsp
	//names var for storing the selected emails form the jsp
	        List list = Arrays.asList(names);//method for converting  the names array into list
			session.setAttribute("emails", list);// for setting the list var as attribute to sending it composemail jsp for the showing the recipients
			RequestDispatcher rd = request.getRequestDispatcher("/ComposeMail.jsp");//sending the control to the jsp page 
			rd.forward(request, response);//for sending the data which set in this servlet
		}

}
