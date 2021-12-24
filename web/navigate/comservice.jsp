
<%@page import="log.Log"%>
<!--
   Author: indsaccrm.com
   Author URL: http://indsaccrm.com.com
-->
<!doctype html>
<html lang="en">
  <head> <link rel="shortcut icon" href="../dist/img/u.png" type="image/x-icon" />
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Best Customer Relationship Management Software | Features :: indsaccrm.com</title>

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
  <body id="Services for IT Industry">

      <%  Log.writeWEBLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" "+request.getProtocol()+", "+request.getRemoteAddr()+""
              + ", "+request.getRemoteHost()+", Entering comservice.jsp");
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
					<li><a href="Computer.jsp">Computer <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                    <li class="active">Services for IT Industry</li>
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
                <img src="assets/images/itp.png" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h4> You can plan and manage IT projects here</h4>
                    <p class="para">CRM is the one that handles your work to ease your high-efforts. Customer Relationship Management (CRM) can plan and control your crucial projects.
It can handle your IT projects too as it can structure your projects, focus on target, goals, budget, etc from the starting. This is the best way for not meeting up with any big issues. You can also watch project status just for a reminder.</p>
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
                    <h4>Boost up the customer satisfaction and loyalty</h4>
                    <p class="para">CRM users use less features of CRM. If they start focusing on every feature then their work can be done in a great way as well. Every industry keeps their eyeballs on customer support service, because the customer is the king for every industry or for every sector. 
					INDSAC-CRM for  IT industry is to offer the timely and efficient customer support and help to their customers that daily deals with them. 
					</p>
                </div>
				 <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/itp1.png" alt="product" class="img-responsive ">
            </div>
            </div>
        </div>
    </div>
</section>




<section class="w3l-content-with-photo-4">
    <div class="content-with-photo4-block">
        <div class="container">
            <div class="cwp4-two row">
            <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/itp3.png" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h4>CRM Analytics</h4>
                    <p class="para">INDSAC-CRM process, interpret and report the data of sales and operations to build a picture of the ideal customer and current performance of operations. 
					This doesn't just enable companies to focus more on which marketing campaigns work, but also they can improve operational efficiency. 
					Employees also generate reports to share internally and with their customers faster, and have to depend less on multiple tools for the same, since all the information become available in a single integrated tool.</p>
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
              + ", "+request.getRemoteHost()+", Leaving comservice.jsp");
      %>
</body>

</html>