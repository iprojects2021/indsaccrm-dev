
<%@page import="blezz.Poul"%>
<%@page import="log.Log"%>
<!--
   Author:indsaccrm.com
   Author URL: http://indsaccrm.com
-->
<!doctype html>
<html lang="en">
  <head><link rel="shortcut icon" href="../dist/img/u.png" type="image/x-icon" />
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

   <title>Best CRM Software | About :: indsaccrm.com</title>
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
                    <li class="active">About</li>
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
                <img src="assets/images/team.gif" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h4>About INDSAC-CRM </h4>
                    <p class="para">  Business solutions platform for the  digital age.
				INDSAC-CRM	has a very well-equipped solutions with some unique features.  Providing the business solutions for across all industry segments with an aim to give access to all. Every business has the right to acess world class business solutions. Its the guiding principle behind our work, and reinforcess our belief that the best technology makes your business  smarter. </p>
                       
                   
                </div>
            </div>
        </div>
    </div>
</section>
   				<section class="w3l-recent-work-hobbies">
   				    <div class="recent-work ">
   				        <div class="container">
<div class="left-text">
	<h3>A product to meet every needs</h3>
	<p class="para">    </p>
</div>
<div class="row about-about">
	<div class="col-lg-4 col-md-6">
		<div class="about-grids">
<h4>Who we are</h4>
<p class="para">Young Entrepreneurs  fostering the next generation of entrepreneurs and business leaders and having the right mindset to provide the good platform for every business.  </p>
<div class="mt-3 about-list">
	<ul>
		<li ><span class="fa fa-chevron-circle-right" aria-hidden="true"></span>
			<p class="para"> To create integrated values</p>
		
		</li>
		<li><span class="fa fa-chevron-circle-right" aria-hidden="true"></span>
			<p class="para">Take on a stronger responsibility</p>
		</li>
		<li><span class="fa fa-chevron-circle-right" aria-hidden="true"></span>
			<p class="para">Deliver innovative products </p>
		</li>
	</ul>
</div>
		</div>
	</div>
	<div class="col-lg-4 col-md-6 about-line-top">
		<div class="about-grids">
<h4>Discovery</h4>
<p class="para">With an aim to constantly reinvents new business solutions across all domain with new technology and deliver to pursue happier and richer lives.  We develop and expand strategic products for providing business experience.</p>
<div class="mt-3 about-list">
	<ul>
		<li ><span class="fa fa-chevron-circle-right" aria-hidden="true"></span>
			<p class="para">Deliver innovative design </p>
		
		</li>
		
		<li><span class="fa fa-chevron-circle-right" aria-hidden="true"></span>
			<p class="para">To cater diverse business preferences</p>
		</li>
	</ul>
</div>
		</div>
	</div>
	<div class="col-lg-4 col-md-6 about-line-top">
		<div class="about-grids">
<h4>Our Vision</h4>
<p class="para">To be recognized as the industry leader driving modernization in IT services  in the developing world and to be the centre of modern Research and Development in IT sector. </p>
<div class="mt-3 about-list">
	<ul>
		<li ><span class="fa fa-chevron-circle-right" aria-hidden="true"></span>
			<p class="para"> Improve CRM services</p>
		
		</li>
		<li><span class="fa fa-chevron-circle-right" aria-hidden="true"></span>
			<p class="para">Modern Research and Development </p>
		</li>
		<li><span class="fa fa-chevron-circle-right" aria-hidden="true"></span>
			<p class="para">Develop and deliver best services.</p>
		</li>
	</ul>
</div>
		</div>
	</div>
</div>
   				        </div>
   				    </div>
   				</section>
<section class="w3l-about ">
<div class="skills-bars text-center">
 <div class="container">
<div class="row counter-width">
 <div class="counter-counter col-lg-3 col-md-3 col-sm-6">
<h4>Active clients</h4>
<span>250</span>
 </div>
 <div class="counter-counter col-lg-3 col-md-3 col-sm-6">
  <h4>Projects Done</h4>
  <span>170+</span>
   </div>
   <div class="counter-counter col-lg-3 col-md-3 col-sm-6">
    <h4>Success Rate</h4>
    <span>90%</span>
     </div>
     <div class="counter-counter col-lg-3 col-md-3 col-sm-6">
      <h4>Get Awards</h4>
      <span>70+</span>
       </div>
 </div>
</div>
</div>
 </section>
<section class="w3l-team-main-6">
	<!-- /team-grids -->
	<div class="team-content">
		<div class="container">
            <div class="main-titles-head text-center">

                <h3 class="header-name">
					 Our Awesome Features
                </h3> 
            </div>
			<div class="row grid-col-4 text-center">
                <div class="team-colomn col-lg-3 col-md-6 col-sm-6">
				<div class="team-main-6">
					<div class="right-team-9">
						<a href="lead.jsp"><img class="img-responsive" src="assets/images/leadm.svg" alt=" "></a><br>
						<h6><a href="lead.jsp" class="title-team-32">Lead Management</a></h6>
				
					</div>
                </div>
            </div>
            <div class="team-colomn col-lg-3 col-md-6 col-sm-6">
				<div class="team-main-6">
					<div class="right-team-9">
						<a href="inventory.jsp"><img class="img-responsive" src="assets/images/inventm.png" alt=" "></a><br>
						<h6><a href="inventory.jsp" class="title-team-32">Inventory Management</a></h6>
					
					</div>
                </div>
            </div>
            <div class="team-colomn col-lg-3 col-md-6 col-sm-6">
				<div class="team-main-6">
					<div class="right-team-9">
						<a href="process.jsp"><img class="img-responsive" src="assets/images/processm.png" alt=" "></a><br><br>
						<h6><a href="process.jsp" class="title-team-32">Process Management System</a></h6>
					
					</div>
                </div>
            </div>
            <div class="team-colomn col-lg-3 col-md-6 col-sm-6">
				<div class="team-main-6">
					<div class="right-team-9">
						<a href=" "><img class="img-responsive" src="assets/images/billingm.png" alt=" "></a><br><br>
						<h6><a href=" " class="title-team-32">Invoice Management System</a></h6>
		
					</div>
                </div>
            </div>

			</div><br>
			<div class="row grid-col-4 text-center"><div class="team-colomn col-lg-4 col-md-6 scol-sm-6" ></div>
			<div class="team-colomn col-lg-4 col-md-6 scol-sm-6" >
				<div class="team-main-6">
					<div class="right-team-9">
						<a href="feature.jsp"><img class="img-responsive" src="assets/images/more.gif" alt=" "></a>
						<h6><a href="feature.jsp" class="title-team-32">Explore More Features</a></h6>
		
					</div>
                </div>
            </div>
			</div>
		</div>
	</div>
	<!-- /team-grids -->

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
