<%-- 
    Document   : traildeveloper
    Created on : 25 Jun, 2020, 10:26:52 AM
    Author     : Sachin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <div> <h5 align="left">Change Status <strong>:</strong>
                 <form action="statuschange" method="post">
                     <select id="status"   name="status" >
                          
                          <option value="Open">Open</option>
                          <option value="Attempted Contact">Attempted Contact</option>
                            <option value="Not Engaged">Not Engaged</option>
                           
                                <option value="Disqualified">Disqualified</option>
                     </select>
                     <select id="disqualified" name="disqualified" hidden >
                         <option value="">Select</option> 
                       <option value="Already Purchased">Already Purchased</option>  
                        <option value="Product Not Available">Product Not Available</option>
                       
                     </select>
                   
                 <input type="submit" value="Submit">
                 </form>
                 </h5> 
            
        </div>
        <script>  
             $("#status").click(function() {
                 if(document.getElementById("status").value=="Disqualified"){
  $("#disqualified").show(); }
  });
  $("#status").click(function() {
                 if(document.getElementById("status").value!="Disqualified"){
  $("#disqualified").hide(); }
  });
             </script>
    </body>
</html>
