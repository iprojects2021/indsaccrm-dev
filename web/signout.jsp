<%-- 
    Document   : signout
    Created on : 2 May, 2020, 12:13:41 PM
    Author     : Sachin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <% 
 
        
            session.invalidate(); 
            
            response.sendRedirect("login.jsp");
        
        %>
        
    </body>
</html>
