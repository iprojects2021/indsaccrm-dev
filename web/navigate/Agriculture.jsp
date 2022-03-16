
<%@page import="blezz.Poul"%>
<%@page import="log.Log"%>
<!--
   Author: www.indsaccrm.com
   Author URL: https://www.indsaccrm.com
-->
<!doctype html>
<html lang="en">
  <head><link rel="shortcut icon" href="../dist/img/u.png" type="image/x-icon" />
        <link rel="canonical" href="https://www.indsaccrm.com/Agriculture.jsp" />
        <link rel="apple-touch-icon" href="dist/img/u.png"/>
        <link rel="alternate" hreflang="en" href ="https://www.indsaccrm.com/" />
      
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="CRM software for the agriculture industry allows farmers to store and follow up on customer leads to help find new customers, track customer behavior, interactions, and purchases of products and services">


    <title>Agriculture Industry | Industry :: indsaccrm.com</title>

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
  <body id="Agriculture">

      <%  Log.writeWEBLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" "+request.getProtocol()+", "+Poul.getPublicIP()+""
              + ", "+request.getRemoteHost()+", Entering Agriculture.jsp");
      %>
 <%@include file="header.jsp" %>
 
 
  <section class="w3l-inner-banner-main">
        <div class="about-inner inner2">
            <div class="container seen-w3">
                <ul class="breadcrumbs-custom-path">
                    <li><a href="../index.jsp">Home <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                    <li class="active">Agriculture Industry</li>
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
                <img src="assets/images/a1.png" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h4>Agriculture Industry</h4>
                    <p class="para">CRM software for the agriculture industry allows farmers to store and follow up on 
                        customer leads to help find new customers, track customer behavior, interactions, and purchases of products and services.</p>
                    <div class="jst-two-coloums mt-4">
                        <div class="icon-text">
                            <h5> <a href="#" ></a>
                            </h5>
                            <p class="para"> It also helps to develop personalized and targeted marketing activities that have a better chance of creating a relationship with the buyers and the supply chain.</p>
                       </div>
                        <div class="icon-text mt-lx-3 pt-lx-1">
                            <h5 ><a href="#" ></a>
                            </h5>
                            <p class="para">Agriculture industry CRM needs to maintain long-term relationships with their buyers, agents, and supply chain customers, while gaining the
                                reputation of providing value to customers, increasing their loyalty, and achieving mutual trust.</p>
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
	<h3>Automate Your Agriculture Business Using CRM</h3>
	<p class="para">The main goal of INDSAC-CRM is to help businesses in building good relationships with clients and provide good management of your 
	client base along with a variety of other agricultural processes. </p><br>
	
<p class="para">By using CRM in your agricultural business, you can deal with suppliers, customers, and so on. To be
    precise, it is capable of storing contacts, adding information about deals, getting access to price history, and more. <br><br>
1. Show you the best purchase offers<br><br>
2. Keep track of how effective your managers are<br><br>
3. Give an opportunity to work remotely<br><br>
4. Allow users to access only the information they are supposed to see</p><br>
</div>


<div class="left-text">
	<h3>CRM Tasks for Agriculture Business</h3>
	<p class="para">CRM for agribusiness is able to keep track of equipment along with machinery, and the total number
            of livestock. Besides, it is able to track the growth of a variety of animals and plants. INDSAC-CRM for 
            agribusiness constantly analyzes the needs and preferences of their customer in order to provide them with the most essential features. </p><br>
	
<p class="para">
1. Plan a task list that is based on natural cycles<br><br>
2. Keep a record of a warehouse and other physical assets<br><br>
3. Keep finances under control<br><br>
4. Manage documentation<br><br>
5. Control of employee's working efficiency</p>
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
              + ", "+request.getRemoteHost()+", Leaving Agriculture.jsp");
      %>
</body>

</html>