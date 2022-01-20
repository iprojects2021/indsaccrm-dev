
<%@page import="blezz.Poul"%>
<%@page import="log.Log"%>
<!--
   Author: indsaccrm.com
   Author URL: http://indsaccrm.com.com
-->
<!doctype html>
<html lang="en">
  <head><link rel="shortcut icon" href="../dist/img/u.png" type="image/x-icon" />
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title> Instant Customer Surveys | Best CRM Software | Indsac Crm :: indsaccrm.com</title>

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
  <body id="Contact Management">


      <%  Log.writeWEBLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" "+request.getProtocol()+", "+Poul.getPublicIP()+""
              + ", "+request.getRemoteHost()+", Entering taskmanagement.jsp");
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
                    <li ><a href="services.jsp">Services <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
		<li ><a href="sales.jsp">Sales Automation <span class="fa fa-angle-right" aria-hidden="true"></span></a></li> 
                    <li class="active">Instant Customer Surveys</li>
                </ul>
            </div>
        </div>
    </section>
<!-- breadcrumbs //-->
<section class="w3l-content-with-photo-4">
    <div class="content-with-photo4-block">
        <div class="container">
		      <div class="main-titles-head text-center">
                <h3 class="header-name">
                Instant Customer Surveys and Feedback
                </h3> 

            </div>
            <div class="cwp4-two row">
            <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/survey3.png" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                   <br><br><br>
                    <p class="para"> Connect with your customers to better understand their needs. </p><br>
                       <p class="para">Customer satisfaction surveys give you the insights you need to make better decisions.</p><br>
                     <p class="para"> A consumer survey will help you understand your customers likes, dislikes, and where you need to make improvements. </p>
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
                    <h4>INDSAC Surveys and Feedback Management</h4>
                    <p class="para"> Create easy-to-use surveys by using simple editor collect feedback and information from your customers. 
                        With Feedback Management capabilities, you can deliver relevant and personalized experiences to your customers. 
                        Feedback Management simplifies your feedback management process and maps the feedback to existing customer records at every stage of the customer lifecycle.</p>
                   </div>
	 <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/survay2.gif" alt="product" class="img-responsive ">
            </div>
            </div>
            <br> <br> 
            
            
            <div class="container">
	
            <div class="cwp4-two row">
          
                <div class="cwp4-text col-xl-6">
                    <h4> Benefit of Customer Feedback Surveys</h4>
                    <p class="para"> 1. They give every member of your audience an equal say.<br><br>
                    2. It allows them to be anonymous, and therefore more truthful with their opinions.<br><br> 
                    3. It can provide you with a clear, statistically significant analysis. <br><br>
                    4. You can target a specific audience, based on geography, demographics, and other filters. <br><br>
                    5. You can direct the conversation to avenues you prefer to know more about, 
                    avoiding the distractions that are otherwise abound.<br><br>
                   </p>
                   </div>
	 <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/lappy.gif" alt="product" class="img-responsive ">
            </div>
            </div>
            </div><br><br>
            
 <div class="text-center">
   <h3 class="header-name">Instant Feedback</h3>
     </div><br>
            <p class="para">An instant customer feedback system is a key function of understanding what your customers 
                think and feel, as well as understanding their interactions with your site and product. 
                Customer feedback and reviews are more important than ever in today's ever-changing digital world.
            Businesses of all sizes can benefit from customer feedback, but growing ones especially. </p>
            <br><br><br>
            <div class="cwp4-two row">
            
                <div class="cwp4-text col-xl-6">
                    <h3 class="header-name"> Accurate Results </h3> <br>
                <p class="para">With Feedback Management, customers don't have to leave the chat window to provide feedback. 
                    Post-Chat Surveys reduce the need for the survey taker to recall information, ensuring that you're gathering accurate feedback.</p>
                    </div>
                
                <div class="cwp4-text col-xl-6">
                    <h3 class="header-name">  Capture Feedback </h3> <br>
                <p class="para">Customer send their feedback via web link or email, then efficiently share insights 
                    with your teams so you can deepen customer relationships and improve retention.</p>
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
              + ", "+request.getRemoteHost()+", Leaving taskmanagement.jsp");
      %>
</body>

</html>