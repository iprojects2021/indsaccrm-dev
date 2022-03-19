
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="blezz.Poul"%>
<%@page import="email.EmergencyEmail"%>
<!--
   Author: www.indsaccrm.com
   Author URL: https://www.indsaccrm.com
-->
<!doctype html>
<%@page  import="log.Log" %>
<html lang= "en">
  <head><link rel="shortcut icon" href="../dist/img/u.png" type="image/x-icon" />
      <link rel="canonical" href="https://www.indsaccrm.com/navigate/invoicemanagement.jsp" />
      <link rel="apple-touch-icon" href="dist/img/u.png"/>
      <link rel="alternate" hreflang="en" href ="https://www.indsaccrm.com/navigate/invoicemanagement.jsp" />
          
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Your CRM lets you grow your relationship with your customers, and quotes and invoices are just one part of that">
    <meta property="og:title" content="CRM Invoice"/>
    <meta property="og:type" content="article"/>
    <meta property="og:url" content="https://www.indsaccrm.com/navigate/invoicemanagement.jsp"/>
    <meta property="og:image" content="https://www.indsaccrm.com/web/navigate/assets/images/invoice.gif"/>
    <meta property="og:image:secure_url" content="https://www.indsaccrm.com/web/navigate/assets/images/invoice.gif"/>
    <meta property="og:site_name" content="indsaccrm.com"/>
    <meta property="og:description" content="Your CRM lets you grow your relationship with your customers, and quotes and invoices are just one part of that"/>
    <meta property="og:locale" content="en_US"/>

<script type="application/ld+json">{"@context":"https://schema.org","@type":"WebPage","name":"CRM Invoice",
"logo":{"@type":"ImageObject","url":"https://www.indsaccrm.com/web/dist/img/u.png"},"url":"https://www.indsaccrm.com/navigate/invoicemanagement.jsp"}
</script>

    <title> CRM Invoice | Invoice Management System :: indsaccrm.com</title>
    
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
      <%  Log.writeWEBLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" "+request.getProtocol()+", "+request.getRemoteAddr()+""
              + ", "+request.getRemoteHost()+", Entering invoicemanagement.jsp");
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
                    <li class="active"> Invoice Management System </li>
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
                <img src="assets/images/invoice.gif" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h4>INDSAC-CRM With Invoicing</h4>
                    <p class="para">Easily organize your billing with INDSAC-CRM and invoicing software. Perfect for large
                        and small businesses, you get an all-around business tool that goes way beyond simply quoting and 
                        invoicing. 
                    </p>
                    <br>

                     <p class="para">With so many integrations, you can talk to your clients on whatever platform they want 
                         and keep a record of all interactions and billing in one place. When you're ready to send the invoice, 
                         in just a click of a button, you can send it by email or print it as a PDF.

                    </p>
                    <br>                 
                </div>
            </div>
        </div>
    </div>
</section>
<section class="w3l-specification-6">
    <div class="specification-layout">
        <div class="container">
            <div class="main-titles-head">
                <h3 class="header-name">Function of Invoice Management System </h3>             
            </div>
            <div class="specification-effect row text-center">
                <div class="grids-effect-2 col-lg-4 col-md-6 col-sm-6">                       
                    <div class="back-color">
                    <span class="fa fa-pencil" aria-hidden="true"></span>
                    <h4>Create</h4><br>
                    <p class="para">Create invoice either directly adding up customer information such as addresS  and contact details or from finalized quotation
                        invoice system is thoroughly integrated with quotation system. 
                        The contact could be new contact or contact from contact database. </p>
                    </div>
                </div>
                <div class=" grids-effect-2 col-lg-4 col-md-6 col-sm-6">
                    <div class="back-color">
                    <span class="fa fa-edit" aria-hidden="true"></span>
                    <h4>Update</h4><br>
                    <p class="para">Updation for created invoices are allowed. Onces the invoice is created you can send invoice
                        directly to client email address from your crm, save the invoice as PDF, and even print out
                        right from your web browser. Stored invoice in secured formate with advance search function
                        and active history. </p>
                     </div>
                </div>
                <div class="grids-effect-2 col-lg-4 col-md-6 col-sm-6">
                    <div class="back-color">
                    <span class="fa fa-edit" aria-hidden="true"></span>
                    <h4>Customize</h4><br>
                    <p class="para">INDSAC-CRM Invoices serve you to create and send proficient invoices in a minute that 
                       help you get paid faster. Customize invoices from an variety of templates with your logo to make them perfect.
                       Customize header, footer details along with tax details.</p>
                   </div>
               </div>
                <div class="grids-effect-2 col-lg-4 col-md-6 col-sm-6 mt-4 pt-1">
                    <div class="back-color">
                    <span class="fa fa-bell" aria-hidden="true"></span>
                    <h4>Alert</h4><br>
                    <p class="para">Set alert and reminders for invoice due dates and bill receivable pop-ups emails and notifications.
                        Once you?ve got used to receiving alerts, you?ll see just how helpful they are in your invoicing flow.</p>
                    </div>
                </div>
                <div class="grids-effect-2 col-lg-4 col-md-6 col-sm-6 mt-4 pt-1 ">
                    <div class="back-color">
                    <span class="fa fa-credit-card" aria-hidden="true"></span>
                    <h4>Payment Terms</h4><br>
                    <p class="para">Select one of the default payment terms or create your own payment terms, 
                         customizing the customer payment periods specifying your required duration to allow your 
                         customers to make their payments.</p>
                    </div>
               </div>
                <div class="grids-effect-2 col-lg-4 col-md-6 col-sm-6 mt-4 pt-1 ">
                    <div class="back-color">
                    <span class="fa fa-sticky-note-o" aria-hidden="true"></span>
                    <h4>Notes</h4><br>
                    <p class="para">Adding a note helps customers get a clear picture of the product and may lessen the load on your customer support team.
                        Additionally, general notes can be added that are common to all invoices sent out.</p>
                    </div>
                </div>                     
        </div>
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
<%  Log.writeWEBLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" "+request.getProtocol()+", "+request.getRemoteAddr()+""
              + ", "+request.getRemoteHost()+", Leaving invoicemanagement.jsp");
      %>
</body>

</html>