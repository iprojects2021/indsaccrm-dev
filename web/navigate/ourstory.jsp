
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
      <link rel="canonical" href="https://www.indsaccrm.com/ourstory.jsp" />
      <link rel="apple-touch-icon" href="dist/img/u.png"/>
      <link rel="alternate" hreflang="en" href ="https://www.indsaccrm.com/" />
          
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="About Indsac CRM">

    <title>Our Story | Invoice Management System :: indsaccrm.com</title>
    
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
  <body id="Our Story">
      <%  Log.writeWEBLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" "+request.getProtocol()+", "+request.getRemoteAddr()+""
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
                    <li class="active"> Our Story </li>
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
                <img src="assets/images/indsac-crm1.jpg" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">

                    <h4>About CRM </h4>
                    <p class="para">Customer relationship management software is a special system with one primary purpose? improving relationships with
                        clients by providing businesses with smart tools to effectively develop a successful strategy. 
                         CRM software can advance crucial business operations, such as marketing, service and 
                        sales activities, to improve customer experience and loyalty from initial contact to repeat purchases. 
                    </p><br>
                     <p class="para">If your main concern is sales, you can make use of performance tracking for individual sales agents.
                                The CRM software focuses on putting customer needs first and delivering a superior, more personalized customer experience.</p>

                </div>
            </div>
        </div>
    </div>
</section>

 <section class="w3l-content-with-photo-4">
    <div class="content-with-photo4-block">
        <div class="container">
            <div class="cwp4-two row">
                <div class="cwp4-text col-xl-6">
                    <h4>Our Vision </h4>
                    <p class="para">TO BRING POSITIVE TRANSFORMATION TO EVERY LIFE WE TOUCH </p><br>
                    <p class="para">To be recognized as the industry leader driving modernization in IT services in India 
                        and the developing world and to be the centre of modern Research and Development in IT sector. 
                    </p>                    
                </div>
                 <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/indsac-vision.jpg" alt="product" class="img-responsive ">
            </div>
            </div>
        </div>
    </div>
</section>
      <section class="w3l-recent-work-hobbies">
   	                <div class="recent-work ">
          <div class="container">
                         <div class="left-text">
              <h3> How CRM is useful for a company?</h3>
              <p class="para">Customer relationship management systems can be easily customized to meet the specifications needed of any business type and size.<br><br>
                  1. B2B: From managing an account's contact information to staying up to date with business deals, payments, and reports, B2B companies do best with a sales CRM in place.<br><br>
                  2. B2C: B2C companies have shorter customer life cycles, and they typically require a solution that is more direct and less time-consuming.<br><br>
                  3. SMBs: SMBs are not small and medium businesses but smart and modern businesses. There's no truth to the common mistake that cloud CRM is too expensive and complicated for SMBs.<br><br>
                  4. Enterprises: Advanced CRM features like workflow management, advanced analytics, sales, and marketing automation,  can help reduce the time salespeople spent on mundane tasks.</p><br><br>
	      
              <h3> Benefits of CRM </h3>
              <p class="para"> 1. A CRM system manages all your contacts and aggregates lead and customer information to build profiles of everyone you interact with.<br><br>
                               2. Streamlining and improving the sales process, building a sales pipeline, automating tasks, and analyzing your sales data will inevitably lead to one outcome increased sales and sales productivity.<br><br>
                               3. Retention and rates are extremely important determiners for a company?s success; customer churn is a major obstacle to business growth. <br><br>
                               4. Analytical CRM tool make your data available, intelligible, and relevant to your business needs. All your enough of sales data, finance data and marketing data flow into CRM to become visible metrics.<br><br>
                               5. Having all your major day-to-day business functions in one place makes for better workflow, an easier association between team members, and better project management.<br><br>
              </p><br>
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
              + ", "+request.getRemoteHost()+", Leaving index.jsp");
      %>
</body>

</html>