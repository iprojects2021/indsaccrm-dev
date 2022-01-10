
<%@page import="log.Log"%>
<%@page import="blezz.Poul"%>
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

    <title>Best Customer Relationship Management Software |Computer Industry :: indsaccrm.com</title>

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
  <body id="Computer">

      <%  Log.writeWEBLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" "+request.getProtocol()+", "+Poul.getPublicIP()+""
              + ", "+request.getRemoteHost()+", Entering Computer.jsp");
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
                     <li><a href="Computer.jsp">Computer Industry <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                    <li class="active">Improved Communication</li>
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
                <img src="assets/images/impcomm.gif" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h4>Improved Communication</h4>
                    <p class="para"> Good communication delivering consistent brand messaging and support
                        across all channels by understanding customer pain points. It also focuses on 
                        strengthening customer relationships. Having a strong communication strategy 
                        in place helps businesses to acquire and retain customers.

                    </p>
                    <div class="jst-two-coloums mt-4">
                        <div class="icon-text">
                            <h5> <a href="#" ></a>
                            </h5>
                            <p class="para">Both business-to-business (B2B) and business-to-consumer (B2C) businesses use communication skills
                                to design and deliver critical business communications that are highly personalized as well as 
                                interactive.</p>
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
<h3>How Communication Grow Business</h3>
</div>
<h4>Faster customer support </h4>
<p class="para"> Effective communication with customers helps to learn the client's problem accurately and enables you to deliver faster support.</p>
<br><br>

<h4>Level up conversions </h4>
<p class="para"> Assisting customers with the right answers in real time helps to close the sales faster and increase sales conversions.</p>


<br><br>
<h4>Boost customer loyalty</h4>
<p class="para"> Having personalized conversations with customers with the help of visual engagement tools builds trust and cultivates loyalty with your customers.</p>

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
                    <h4>How to improve customer service communication </h4>
                    <p class="para"> 1. Use visual engagement tools for real time assistance <br><br>
                    2. Build omni channel customer communication strategy<br> <br>
                    3.  Improve the first customer experience <br><br>
                    4. Deploy chatbots for automated customer communication<br><br>
                    5. Measure your customer communication metrics regularly<br>
                    </p>
                   </div>
	 <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/impcomm2.gif" alt="product" class="img-responsive ">
            </div>
            </div>
            </div>
        </div>
        </section>>
	
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
              + ", "+request.getRemoteHost()+", Leaving Computer.jsp");
      %>
</body>

</html>