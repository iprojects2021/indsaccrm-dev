
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

    <title>Reporting & Dashboards | Best CRM Software | Indsac Crm :: indsaccrm.com</title>

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
              + ", "+request.getRemoteHost()+", Entering Reporting & Dashboards  dashboard.jsp");
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
					 <li class="active">Reporting & Dashboards</li>
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
                   Reporting & Dashboards
                </h3> 

            </div>
            <div class="cwp4-two row">
            <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/dash1.jpg" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                  
                    <p class="para">Dashboards & Reporting are important tools in the best CRM software. </p><br>
                       <p class="para">Dashboards typically focus on images, graphs, and figures instead of lengthy sections
                           of text. They provide a quick snapshot of your sales activity and key performance indicators (KPI)
                           You and your sales team can use them to see an overview of your sales pipeline's effectiveness 
                           and determine which tasks need to be completed next.</p><br>
                          <p class="para">A CRM report is a management tool that offers all the needed data to strengthen your customer relationships. 
                              They usually exist inside CRM dashboards that connect your data in a way that will make your reports interactive, focused, and efficient through automation.</p><br>
                </div>
            </div>
        </div>
    </div>
</section>


<section class="w3l-recent-work-hobbies">
    <div class="recent-work ">
   <div class="container">
<div class="left-text">
	<h3>Benefits of CRM Dashboards </h3>

  <h4>It keeps your team on track.<h4>
<p class="para" > 
An in-depth sales report might not always be what your team needs to stay on pace to meet its goals. The top-level 
information that a dashboard presents can be enough to tell your salespeople what needs to get done now and what can wait, 
saving the time and effort of analyzing detailed reports. </p><br>

<h4>It streamlines your team's work. <h4>
<p class="para" > With dashboards, your team can rapidly determine which tasks should be done first without clicking through your CRM software to pull up reports. This function can save tremendous amounts of time. </p><br>

<h4>It updates in real-time. <h4>
<p class="para" > A report is a static document that inflexibly presents data for a given period. A dashboard, on the other hand, reacts to and reflects changes in your data instantly. 
    This way, your team gets to build its strategy based on your most recent KPI data rather than outdated numbers. </p><br>

<h4>It results in stronger sales processes overall. <h4>
<p class="para" >Dashboards bring your sales team's work into the present tense, they result in better overall sales 
    performance. A current picture of your sales pipeline and your prospect's progress along it is far more meaningful to 
    your team than data from an old report, so CRM dashboards are especially powerful in guiding your sales team.
 </p><br>
</div>
  </div>
     </div>
    </section>

<section class="w3l-recent-work-hobbies">
    <div class="recent-work ">
   <div class="container">
<div class="left-text">
	<h3>Benefits of CRM Reporting </h3>

  <h4>Better decision-making.<h4>
<p class="para" > CRM reporting and CRM reporting tools will help you make quicker, more informed decisions based on robust, reliable visual data. </p><br>

<h4>Increased insight <h4>
<p class="para" >CRM reporting software offers you in-depth insights based on historic, predictive, and in-the-moment data.</p><br>
<p class="para" >The digestible visual information served up by CRM dashboards will empower you to spot emerging trends, identify strengths and weaknesses, and ultimately, meet the needs of your customers head-on. </p><br>

<h4>More engagement <h4>
<p class="para" >One of the top benefits of CRM reporting is effective campaign tracking. 
    When done correctly, it will enable you to compile relevant information related to your customers behaviors and preferences in different touch points and understand if your marketing initiatives are effective. </p><br>

<h4>Consistent performance  <h4>
<p class="para" >CRM reporting allows you to set actionable benchmarks while monitoring your performance in various areas with pinpoint accuracy. </p><br>

<h4>Maximum access & efficiency <h4>
<p class="para" >With CRM reports, you can give everyone in your customer service department the tools to improve their performance with data analytics. 
    And when you do that, communication will improve, productivity will increase, and you will be able to benefit from the power of business intelligence (BI), 24/7. </p><br>
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
              + ", "+request.getRemoteHost()+", Leaving Reporting & Dashboards dashboard.jsp");
      %>
</body>

</html>