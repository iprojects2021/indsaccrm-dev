
<%@page import="blezz.Poul"%>
<%@page import="log.Log"%>
<!--
   Author: indsaccrm.com
   Author URL: http://indsaccrm.com.com
-->
<!doctype html>
<html lang="en">
  <head>  <link rel="shortcut icon" href="../dist/img/u.png" type="image/x-icon" />
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Best Customer Relationship Management Software | Education Industry :: indsaccrm.com</title>

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
  <body id="Education">


      <%  Log.writeWEBLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" "+request.getProtocol()+", "+Poul.getPublicIP()+""
              + ", "+request.getRemoteHost()+", Entering Education.jsp");
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
                    <li class="active">Education Industry </li>
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
                <img src="assets/images/indsac-education.gif" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h4> Education CRM</h4>
                    <p class="para">Education CRM systems are software applications means to automate and manage communications with current students, employees, alumni, etc.
					</p>
                    <div class="jst-two-coloums mt-4">
                        <div class="icon-text">
                            <h5> <a href="#" > </a>
                            </h5>
                            <p class="para">There are many more processes handled by the CRM, the most important ones are the applicant and inquiry management, 
							student communication, admission notifications, enrollment management, analytics, and reporting. </p>
                       </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

   				<section class="w3l-recent-work-hobbies">
   				    <div class="recent-work ">
   				        <div class="container">
<div class="left-text">
	<h3>Why educational industry need CRM</h3>
	<p class="para">It is a software application used to automate and handle communication with current students, 
            employees, and alumni. All this work is done on a single system. Every connection with customers is tracked by 
            the customer relationship management system in one place. With the help of customer relationship management 
            software, you can take feedback from the customers, department, and students. Each interaction with your 
            customers is tracked by the customer relationship management system.</p> <br>
</div>

<div class="left-text">
	<h3>Why choose INDSAC-CRM for educational purposes?</h3>
	<p class="para">INDSAC-CRM is best for its services. It is a smart decision to access some businesses. In the
            educational field ether, it is a school or college, the load of work is more. It is always a question of how 
            they manage the record of students, staff, and other employees in a perfect way. But the customer relationship 
            management system solves this problem easily.</p> <br>
</div>

<div class="left-text">
	<h3>Features of CRM For Educational Organization</h3>
	<p class="para">1. Centralize students' information. This keeps all the data of students, staff, and admission records in one software.<br><br>
2. Manage student inquiries and courses enquired.<br><br>
3. Manage student's enrolment information<br><br>
4. Maximize student's admission efficiency<br><br>
5. Mange whole marketing and students admission lifecycle<br><br>
6. Run emails, SMS marketing, and information campaigns to attract the students<br><br>
7. Manage the facility data<br><br>
8. Secure way to run the business<br><br>
9. Cost-efficient<br><br>
10. Real-time reporting and analytical reports<br><br>
11. Use education customer relationship management system on the desktop, phone, and tablets</p> 
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
<%  Log.writeWEBLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" "+request.getProtocol()+", "+Poul.getPublicIP()+""
              + ", "+request.getRemoteHost()+", Leaving Education.jsp");
      %>
</body>

</html>