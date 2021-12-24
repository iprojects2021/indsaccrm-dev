
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

    <title>E-Mail Integration | Best CRM Software | Indsac Crm :: indsaccrm.com</title>

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
              + ", "+request.getRemoteHost()+", Entering E-Mail Integration email.jsp");
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
					 <li class="active">E-Mail Integration</li>
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
                   E-Mail Integration
                </h3> 

            </div>
            <div class="cwp4-two row">
            <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/email1.png" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                   
                    <p class="para"> Email integration in your CRM lets you automatically capture your messages to and from your contacts to your account.  </p><br>
                       <p class="para">  INDSAC-CRM automatically associates all e-mails with their respective customer records, so you'll never have to comb through a mountain of messages to send your next round of follow-ups.</p><br>
                     <p class="para"> These tools offer you a wide variety of additional ways to engage with your customers and subscribers at different points in the campaign..</p>
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
                    <h4>Benefits of E-Mail Integration</h4>
                    <p class="para"> 1. CRM makes the outreach highly appealing due to collecting prospects personal data, creating a holistic view of a prospect, and crafting e-mails based on it. <br><br>
                    2. CRM has pre-designed email templates, which allow customers to create visually appealing branded messages.<br> <br>
                    3. Saves any documents attached to an email to the company account record. <br><br>
                    4. Synchronizes in real-time so your team will always see the latest correspondence.<br><br>
                    5. Automatically create new customer support cases from incoming email..<br><br>
                    6. Automatically capture e-mails to and from your CRM contacts to your activities timeline.</p>
                   </div>
	 <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/email2.png" alt="product" class="img-responsive ">
            </div>
            </div>
           </div><br><br><br>
        <div class="main-titles-head text-center">

                <h3 class="header-name">
				INDSAC-CRM email integration for complete transparency<br> of every interaction across your team.
                </h3>
            </div>
    </div>
</section>
   		
<section class="w3l-content-with-photo-4">
    <div class="content-with-photo4-block">
        <div class="container">
            <div class="cwp4-two row">
                <div class="cwp4-text col-xl-6">
                     <h3 class="header-name">Automatic Email Capture</h3> <br>
                   <p class="para"> Our email integration creates a history of every interaction with your prospects and customers. 
                       Your system automatically captures your incoming and outgoing e-mails and stores them in your account activities.
                   <br>The -emails are stored in chronological order, with a summary grid letting you select what information to display and store any attached documents.
                   </p>
                </div>
                
                <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/email3.jpg" alt="product" class="img-responsive ">
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
                <img src="assets/images/email7.jpg" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h3 class="header-name">Email Attachments </h3> <br>
                <p class="para">The CRM will store any attached documents to the email record. 
                    This might be your proposal documents, meeting minutes, quotations or images. The volume of documents stored is determined by your CRM price plan.</p>
                    
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
                     <h3 class="header-name">Real-time Sync</h3> <br>
                   <p class="para"> Email integration works across the email accounts of all your CRM users and all your CRM contacts. 
                       As it synchronizes in real-time, you'll be able to see all the messages to and from your customers, along with other activities, whether you're in the office or out on the road.
                   </p>
                </div>
                
                <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/email10.jpg" alt="product" class="img-responsive ">
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
                <img src="assets/images/email4.png" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h3 class="header-name">Email status updates </h3> <br>
                <p class="para">INDSAC-CRM informs you when your e-mails were delivered, if they've been opened, and when they were read. 
                    You can also use advanced filters to identify leads who haven't responded within a certain time-frame as well as leads that are responding well and are ready to close. 
                    This analysis allows you to strategically plan your follow-ups for maximum benefit.</p>
                    
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
                     <h3 class="header-name">Email Templates</h3> <br>
                   <p class="para"> Templates are a quick, easy way to free yourself from the tedium of drafting e-mails. Design a template to suit your business, or choose from our gallery of handpicked templates and customize them with text, images, tables, and columns. 
                       You can also get reports to find out which email templates had the best open rates and which ones failed to click. 
                   </p>
                </div>
                
                <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/email9.jpg" alt="product" class="img-responsive ">
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
              + ", "+request.getRemoteHost()+", Leaving E-Mail Integration email.jsp");
      %>
</body>

</html>