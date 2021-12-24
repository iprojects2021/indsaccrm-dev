<%-- 
    Document   : testemailsend
    Created on : 22 Dec, 2021, 2:37:54 PM
    Author     : Dell
--%>

<%@page import="blezz.EmailSendingRegisterCode"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%   String type=request.getParameter("type");
    if(type!=null){
        String email=request.getParameter("email");
         String name=request.getParameter("name");
         String chec=EmailSendingRegisterCode.getEmailRegisterCode(email, name);
         System.out.println(chec);
    }
    %>
    
    <body>
        <h1>Hello World!</h1>
        <form action="">
        <input type="text" name="email">
        <input type="text" name="name">
        <input type="hidden" name="type" value="type">
        <input type="submit" value="submit">
        </form> 
               
    </body>
</html>
