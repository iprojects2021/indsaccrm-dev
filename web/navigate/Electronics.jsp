
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

    <title>Best Customer Relationship Management Software | Resources :: indsaccrm.com</title>

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
  <body id="Electronics">


      <%  Log.writeWEBLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" "+request.getProtocol()+", "+Poul.getPublicIP()+""
              + ", "+request.getRemoteHost()+", Entering Electronics.jsp");
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
                    <li class="active">Electronics Industry</li>
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
                <img src="assets/images/erm.jpg" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h4>E-CRM?</h4>
                    <p class="para">E-CRM, or Electronic Customer Relationship Management, is an integrated online sales, marketing and service strategy that is used to 
					identify, attract and retain an organisations customers.
                    </p>
                    <div class="jst-two-coloums mt-4">
                        <div class="icon-text">
                            <h5> <a href="#" ></a>
                            </h5>
                            <p class="para">It describes improved and increased communication between an organisation and its clients by creating and enhancing customer interaction through innovative technology.  </p>
                       </div>
                        <div class="icon-text mt-lx-3 pt-lx-1">
                            <h5 ><a href="#" ></a>
                            </h5>
                            <p class="para">E-CRM software provides profiles and histories of each interaction the organisation has with its customers, making it an important tool 
							for all small and medium businesses.</p>
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
	<h3>Business Benefits of E-CRM </h3>
	<p class="para">Implementation of an E-CRM system enables an organization to streamline processes and provide sales, marketing and service personnel with better, 
	more complete customer information. The result is that E-CRM allows organizations to build more profitable customer relationships and decrease operating costs.</p>
	<br>
	<p class="para">Businesses that strategize and implement an E-CRM solution are able to align their processes around technology to effectively deliver seamless,
	high-quality customer experience across all channels. Customers have the power to help themselves through online personalized services that are made available on demand. 
	The Internet provides a simple and ideal medium where customers can get information from websites, buy products and find answers using FAQ sections, forums or chat rooms.  </p>
	<br>
	<p class="para">The benefits of E-CRM include the following <br><br>

1. Improved customer relations, service and support<br><br>
2. Matching the customers' behavior with suitable offers<br><br>
3. Increased customer satisfaction and loyalty<br><br>
4. Greater efficiency and cost reduction<br><br>
5. Increased business revenue</p>

</div>
<br > <br>
<div class="left-text">
	<h3>Benefits of E-CRM</h3>
	</div>
<div class="row about-about">
	<div class="col-lg-4 col-md-6">
		<div class="about-grids">

<h4>Customer management</h4>
<p class="para">Provides access to all customer information including enquiry status and correspondence.</p>
<div class="mt-3 about-list">
	
</div>
		</div>
	</div>
	<div class="col-lg-4 col-md-6 about-line-top">
		<div class="about-grids">
<h4> Knowledge management</h4>

<p class="para">A centralised knowledge base that handles and shares customer Information. </p>
<div class="mt-3 about-list">
	
</div>
		</div>
	</div>
	<div class="col-lg-4 col-md-6 about-line-top">
		<div class="about-grids">
<h4>Back-end integration</h4>
<p class="para">Blends with other systems such as billing, inventory through relevant customer contact points such as websites and call centres.</p>
<div class="mt-3 about-list">

</div>
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
<%  Log.writeWEBLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" "+request.getProtocol()+", "+Poul.getPublicIP()+""
              + ", "+request.getRemoteHost()+", Leaving Electronics.jsp");
      %>
</body>

</html>