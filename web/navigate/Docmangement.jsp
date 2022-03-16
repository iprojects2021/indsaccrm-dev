
<%@page import="blezz.Poul"%>
<%@page import="log.Log"%>
<!--
   Author:www.indsaccrm.com
   Author URL: https://www.indsaccrm.com
-->
<!doctype html>
<html lang="en">
  <head><link rel="shortcut icon" href="../dist/img/u.png" type="image/x-icon" />
        <link rel="canonical" href="https://www.indsaccrm.com/Docmangement.jsp" />
        <link rel="apple-touch-icon" href="dist/img/u.png"/>
        <link rel="alternate" hreflang="en" href ="https://www.indsaccrm.com/" />
        
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Ensure the right people have access to the right documents and associate these documents with their respective deals with a centralized repository for all your sales collaterals">


   <title>Document Management | Document Management :: indsaccrm.com</title>
    <!-- Template CSS -->
    <link rel="stylesheet" href="assets/css/style-starter.css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Muli:400,600,700&display=swap" rel="stylesheet">
 <style>
.dropbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #3e8e41;}
</style>
  </head>
  <body id="about">


      <%  Log.writeWEBLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" "+request.getProtocol()+", "+Poul.getPublicIP()+""
              + ", "+request.getRemoteHost()+", Entering about.jsp");
      %>
 <%@include file="header.jsp" %>
    <script src="assets/js/jquery-3.3.1.min.js"></script> <!-- Common jquery plugin -->
    <!--bootstrap working-->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- //bootstrap working-->
<!-- disable body scroll which navbar is in active -->
<script>
    $(function () {
      $('.navbar-toggler').click(function () {
        $('body').toggleClass('noscroll');
      })
    });
  </script>
  <!-- disable body scroll which navbar is in active -->


<!-- breadcrumbs -->
    <section class="w3l-inner-banner-main">
        <div class="about-inner inner2">
            <div class="container seen-w3">
                <ul class="breadcrumbs-custom-path">
                    <li><a href="../index.jsp">Home <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                    <li><a href="Food.jsp">Food Industry<span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                    <li class="active"> Managing Documents </li>
                </ul>
            </div>
        </div>
    </section>
<!-- breadcrumbs //-->
<section class="w3l-content-with-photo-4">
    <div class="content-with-photo4-block">
        <div class="container">
            <div class="cwp4-two row">
            <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/indsac-managing-documents.gif" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h4> Managing Documents</h4>
                    <p class="para">Centralized access to datasheets and other relevant documents.<br><br> Ensure the right people have access
                        to the right documents and associate these documents with their respective deals with a centralized repository
                        for all your sales collaterals.</p>
                </div>
            </div>
        </div>
    </div>
</section>
   				<section class="w3l-recent-work-hobbies">
   				    <div class="recent-work ">
   				        <div class="container">
<div class="left-text">
	<h3>Benefits of a Document Management</h3>
	<p class="para">    </p>
</div>
<p class="para"><h4>1. Full Document Management within CRM</h4><br>
Having a document automation platform integrated with your CRM, you get the privilege of handling the 
communication activities and processing documents in a single window.
 <br><br>Create, access, and edit all of your files from the CRM system. Use the stored in it contact information 
to immediately share the produced papers with your colleagues and clients. The regular update of the document
status in the system makes it easy to track the work progress. </p>
              <br>      <br>                                
       <p class="para"><h4>2. Reduced Time Spent on Document Creation </h4> <br>
       Facilitate your business processes by reducing the time spent on producing documents. 
       With the integration, gone is the need to manually insert the case-specific information into a template.
<br><br>
        The relevant data from a CRM system, including information about contacts, products, and pricing, 
        is automatically populated into the designated fields in your document.  </p>                                 
        <br><br>
        <p class="para"><h4>3. Workflow Automation</h4> <br>
       Forget about scanning documents and transferring them to your colleagues and clients via email. With an integrated system in your office, you can send all of your papers for approval or signature directly from a CRM system. 
       All the required contact information is already stored in it, making sharing an easy activity.</p>   
        <br>    
</div>
</div>                                                             
</section>


<%@include file="footer.jsp" %>

<!-- move top -->
<button onclick="topFunction()" id="movetop" title="Go to top">
	<span class="fa fa-angle-up"></span>
</button>
<script>
	// When the user scrolls down 20px from the top of the document, show the button
	window.onscroll = function () {
		scrollFunction()
	};

	function scrollFunction() {
		if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
			document.getElementById("movetop").style.display = "block";
		} else {
			document.getElementById("movetop").style.display = "none";
		}
	}

	// When the user clicks on the button, scroll to the top of the document
	function topFunction() {
		document.body.scrollTop = 0;
		document.documentElement.scrollTop = 0;
	}
</script>
<!-- /move top -->
<%  Log.writeWEBLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" "+request.getProtocol()+", "+Poul.getPublicIP()+""
              + ", "+request.getRemoteHost()+", Leaving about.jsp");
      %>
</body>

</html>
