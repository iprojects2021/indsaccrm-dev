
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="blezz.Poul"%>
<%@page import="email.EmergencyEmail"%>
<!--
   Author: indsaccrm.com
   Author URL: http://indsaccrm.com.com
-->
<!doctype html>
<%@page  import="log.Log" %>
<html lang="en">
  <head><link rel="shortcut icon" href="dist/img/u.png" type="image/x-icon" />
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Increase Sales,Customer Relationship | indsaccrm.com</title>
    
    <!-- Template CSS -->
    <link rel="stylesheet" href="navigate/assets/css/style-starter.css">
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
  <body id="home">
      <%  Log.writeWEBLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" "+request.getProtocol()+", "+request.getRemoteAddr()+""
              + ", "+request.getRemoteHost()+", Entering index.jsp");
      %>

 <% 
       
         String email=request.getParameter("email");
        
        try{
              Connection con=Poul.getConnectionCRM();
              PreparedStatement ps=con.prepareStatement("insert into subscribe(email,status) values (?,?)");
               
              ps.setString(1,email);
              ps.setString(2,"Open");
              ps.executeUpdate();
              
              con.close();
        
            }catch(Exception e){
            String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n index.jsp-----\n"
            + "\nLINE=83 \n insert insert into subscribe(emailid,status) values (?,?) ";
            Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
            EmergencyEmail.send(e,errormsg);  
        } 
        
        try{
           Connection c=Poul.getConnectionCRM();
           
           Statement st=c.createStatement(); 
           
           String logstatus="Data Update";
           st.addBatch("insert into subscribelog (email,status) values('"+email+"','Update Data') ");
       
           st.executeBatch();        
           st.close();
           c.close();   
           
           }catch(Exception e){
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n index.jsp-----\n"
          + "\nLINE=102 \n insert into subscribelog (email,status) values('"+email+"','Update Data') ";
          Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
          EmergencyEmail.send(e,errormsg); 
        }

    %>     
      
      
<section class=" w3l-header-4 header-sticky">
        <header class="absolute-top">
            <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light">
                <h1><a class="navbar-brand" href="index.jsp"><span class="fa fa-line-chart" aria-hidden="true"></span>
                   INDSAC-CRM
                </a></h1>
                <button class="navbar-toggler bg-gradient" type="button" data-toggle="collapse"
                    data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
          
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="navigate\about.jsp">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="navigate\services.jsp">Services</a>					
                        </li>
			      <li class="nav-item">
			      <a class="nav-link" href="navigate\resources.jsp">Resources</a>					
                        </li>
			<li class="nav-item">
                            <a class="nav-link" href="navigate\feature.jsp">Features</a>
                        </li>
			<li class="nav-item">
                            <a class="nav-link" href="navigate\pricing.jsp">Pricing</a>
                        </li>
						
							
<div class="dropdown">
  <a class="dropbtn  nav-link" >Industry<span class="fa fa-chevron-down" aria-hidden="true"></span>  </a>
  <div class="dropdown-content">
    <a href="navigate\Aerospace.jsp">Aerospace </a>
    <a href="navigate\Transport.jsp"> Transport  </a>
    <a href="navigate\Computer.jsp">  Computer</a>
	<a href="navigate\Telecommunication.jsp">Telecommunication  </a>
	<a href="navigate\Pharmaceutical.jsp">Pharmaceutical  </a>
	<a href="navigate\Food.jsp">  Food</a>
	<a href="navigate\Health Care.jsp"> Health Care   </a>
	<a href="navigate\Construction.jsp">Construction  </a>
	<a href="navigate\Agriculture.jsp">   Agriculture</a>
	<a href="navigate\Education.jsp">  Education</a>
	 <a href="navigate\Electronics.jsp">  Electronics</a>
  </div>
</div>
                    </ul>
                    <ul class="navbar-nav search-righ">
                        <li class="nav-item" title="Search"><a href="login.jsp" class="btn search-search">Login</a></li>
                        <li class="nav-item">
                            <a class="nav-link" href="navigate\contact.jsp">Contact Us</a>
                        </li>
                    </ul>
                   
                </div>
            </div>
  
            </nav>
        </div>
          </header>
    </section>

    <script src="navigate/assets/js/jquery-3.3.1.min.js"></script> <!-- Common jquery plugin -->
    <!--bootstrap working-->
    <script src="navigate/assets/js/bootstrap.min.js"></script>
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


<div class="w3l-hero-headers-9">
    <section class="slide slide-one">
      <div class="container">
        <!-- <div class="row"> -->
          <div class="row">
        <div class="banner-text col-lg-5">
          <h5>Digital Products <br>for Business</h5>
          <p>Increase your Sales, Grow and Retain your customer.</p>
          <form action="login.jsp" name="register" method="post" >  <a onclick="document.register.submit()" class="btn logo-button top-margin">Register</a>
          <input type="hidden"  name="type"  value="register" >
          </form>
              <h6 class="para">Try a <strong> Free Demo </strong>with all the features.</h6>
        </div>
        <div class="image-postion col-lg-7">
          <img src="navigate/assets/images/bb22.jpg" alt="product" class="img-responsive banner-images">
        </div>
        
      </div>
      <!-- </div> -->
    </div>
    </section>
  </div>

<section class="w3l-call-to-action_9">
    <div class="call-w3">
        <div class="container">
            <div class=" main-cont-wthree-2">
                <div class="left-contect-calls text-center">

                  <div class="call-grids-w3 ">
                        <div class="grids-effect-2">
                            <img src="navigate/assets/images/marketing.jpg" alt="">
                        </div>

                        <div class=" grids-effect-2">
                            <img src="navigate/assets/images/sales.jpg" alt="">
                        </div>
                        <div class="grids-effect-2">
                            <img src="navigate/assets/images/inventory.jpg" alt="">
                        </div>
                        <div class="grids-effect-2">
                            <img src="navigate/assets/images/account.jpg" alt="">
                        </div>
                        <div class="grids-effect-2">
                            <img src="navigate/assets/images/analytics.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="w3l-teams-15">

	<div class="team-single-main">
		<div class="container">
			<div class=" grid grid-column-2 row">
				<div class="column1 col-lg-6">
					<img src="navigate/assets/images/happyclient.gif" alt="happy" class="img-responsive ">
				</div>
				<div class="column2 col-lg-6">
					<h3 class="team-head">A better business means better client experience</h3>
					<p class="para text">The journey involves understanding the customer requirements. INDSAC CRM offers you a well executed
                                        customer service strategy which will maximize customer lifetime value. Customer experience impacted customers enthusiasm for being brand advocates.
                                        We provide the smooth communication process between your business and customers. Everything you do impacts your
                                        customer's perception and their decision to keep coming back.</p>
				<p class="para mt-2 dis-none">
					We provide you every touchpoint a customer ever has with your business. By having a measurable indicator
                                        of customer, you can track how your business improves over time and use it to evaluate your success stories.
				</p>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="w3l-specification-6">
    <div class="specification-layout">
        <div class="container">
            <div class="main-titles-head">

                <h3 class="header-name">We Bring The Best Things For Business
                </h3>
              
            </div>
            <div class="specification-effect row text-center">
                <div class="grids-effect-2 col-lg-4 col-md-6 col-sm-6">
                    
                    <div class="back-color">
                    <span class="fa fa-thumbs-up" aria-hidden="true"></span>
                    <h4><a href="navigate/Promotions.jsp" class="title-head">Promotions</a></h4>
                    <p class="para">INDSAC CRM provides you with focused promotional activities which is an excellent way to introduce your product in the market. </p>
                </div>
            </div>
                <div class=" grids-effect-2 col-lg-4 col-md-6 col-sm-6">
                    <div class="back-color">
                    <span class="fa fa-picture-o" aria-hidden="true"></span>
                    <h4><a href="navigate/crmmarketing.jsp" class="title-head">Social Media</a></h4>
                    <p class="para">With INDSAC CRM get campaigns based on your business goals will create a brand identity and positive brand association </p>
                    </div>
                </div>
                <div class="grids-effect-2 col-lg-4 col-md-6 col-sm-6">
                    <div class="back-color">
                    <span class="fa fa-pie-chart" aria-hidden="true"></span>
                    <h4><a href="navigate/360view.jsp" class="title-head">360 Degree View</a></h4>
                    <p class="para">INDSAC 360 degree customer view strategic approach enabling businesses to offer the best customer experience across all channels</p>
                </div>
            </div>
                <div class="grids-effect-2 col-lg-4 col-md-6 col-sm-6 mt-4 pt-1">
                    <div class="back-color">
                    <span class="fa fa-mobile" aria-hidden="true"></span>
                    <h4><a href="navigate/digitalmobile.jsp" class="title-head">Digital & Mobile</a></h4>
                    <p class="para">Utilize the amazing technology where ever you are to benefits your business. View data and receive 
                    valuable alerts in mobile.</p>
                </div>
            </div>
                <div class=" grids-effect-2 col-lg-4 col-md-6 col-sm-6 mt-4 pt-1">
                    <div class="back-color">
                    <span class="fa fa-bolt" aria-hidden="true"></span>
                    <h4><a href="navigate/crmmarketing.jsp" class="title-head"> Marketing</a></h4>
                    <p class="para">Works best for you that will determine and pursue your business marketing goals. Boost visibility and increase sales while sustaining a profit</p>
                </div>
            </div>
                <div class="grids-effect-2 col-lg-4 col-md-6 col-sm-6 mt-4 pt-1 ">
                    <div class="back-color">
                    <span class="fa fa-cubes" aria-hidden="true"></span>
                    <h4><a href="navigate/Planning.jsp" class="title-head">Planing</a></h4>
                    <p class="para">Get high level overview of your entire business that will develop a better understanding 
                    of effective business planning process.</p>
                </div>
            </div>
        </div>
        </div>
    </div>
</section>
 
<!-- grids block 4 -->
<section class="w3l-grids-7">
    <div class="grids4-block">
        <div class="container">
<div class="row">
    <div class="column-text col-lg-6">
        <h3 class="team-head">Create Digital Presence</h3>
        <p class="para text"> Digital Presence matters whenever any person searches for your business online. We will make you go
        digitally.</p>
            <div class="call-grids-w3">
                <div class="grids-1 grids-effect-2">
                    <h4><a href="navigate/crmanalysis.jsp" class="title-head">Data Analysis</a></h4>
                    <p class="para">Deeper understanding  which, in turn, builds better business relationships.</p>
                </div>
                <div class="grids-1 grids-effect-2">
                    <h4><a href="navigate/Analytics.jsp" class="title-head">CRM Analytics</a></h4>
                    <p class="para"> Enable decision makers to make better and more timely business decisions </p>
                </div>
                <div class="grids-1 grids-effect-2">
                    <h4><a href="navigate/digitalmarketing.jsp" class="title-head">Digital Marketing</a></h4>
                    <p class="para">Allows you to find new markets and trade globally for only a small investment. </p>
                </div>
                <div class="grids-1 grids-effect-2">
                    <h4><a href="navigate/crmmarketing.jsp" class="title-head">Social Marketing</a></h4>
                    <p class="para">Increase your business's recognition, traffic, and sales with little to no cost. </p>
                </div>
            </div>            
    </div>
<div class="col-lg-6">
    <img src="navigate/assets/images/digital1.gif" alt="product" class="img-responsive ">
</div>
</div>
        </div>
    </div>
</section>
<!-- grids block 4 -->

<section class="w3l-footers-20">
	<div class="footers20">
		<div class="container">
		
			<h2><a class="footer-logo" href="index.jsp">
				<span class="fa fa-line-chart mr-2"aria-hidden="true"></span>INDSAC_CRM</a></h2>
			<div class=" row">
				<div class="grid-col col-lg-7 col-md-7">
					<h3>Get latest updates and offers.</h3>
					<div class="footer-subscribe mt-4">
						<form action="" method="post" class="input-button">
							<input type="email" name="email" class="form-control" placeholder="Your Email"
								required="">
							<button class="btn footer-button btn-secondary action-button">
								Subscribe
							</button>
						</form>
					</div>
				</div>
				<div class="col-lg-5 col-md-5 footer-bottom-two">
					<ul>
						<li> <a href="navigate\contact.jsp" class="btn action-sub-button">Contact</a></li>
						<li> <a href="navigate\services.jsp" class="btn logo-button top-margin mt-md-3">Our Service</a>
						</li>
					</ul>
				</div>

			</div>
			<div class="border-line-bottom"></div>
			<div class=" row">
				<div class="grids-content col-lg-2 col-md-2 col-sm-6">
			
					<div class="footer-nav">
						<a href="index.jsp" class="contact-para3">Home</a>
						<a href="navigate\about.jsp" class="contact-para3">About</a>
					</div>
				</div>
			<div class="grids-content col-lg-3 col-md-3 col-sm-6">
			
					<div class="footer-nav">
						<a href="navigate\termsofuse.jsp" class="contact-para3">Term of Use</a>
						<a href="navigate\privacypolicy.jsp" class="contact-para3">Privacy Policy</a>
						
						<a href="navigate\ourstory.jsp" class="contact-para3">Our Story</a>			
					</div>					
					</div>					
					<div class="grids-content col-lg-4 col-md-4 col-sm-6">			
					<div class="footer-nav">
						<a href="navigate\resources.jsp" class="contact-para3">What is CRM? </a>
						<a href="navigate\contact.jsp" class="contact-para3">Help Desk </a>						<a href="navigate\whychooseus.jsp" class="contact-para3">Why Choose INDSAC CRM</a>
						
					</div>					
				</div>					
					<div class="grids-content col-lg- col-md- col-sm-">			
					<div class="footer-nav">
						<a href="index.jsp" class="contact-para3">Free Demo</a>
						<a href="navigate\pricing.jsp" class="contact-para3">Pricing </a>				
					</div>					
					</div>
					
				<div class="col-lg- col-md- col-12 copyright-grid ">
					<p class="copy-footer-29">© 2020 | All rights reserved | Design by <a
							href="https://indsac.com" target="_blank"> INDSAC SOFTECH</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	</div>
</section>

<!-- move top -->
<button onClick="topFunction()" id="movetop" title="Go to top">
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