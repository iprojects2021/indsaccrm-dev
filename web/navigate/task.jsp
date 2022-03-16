
<%@page import="blezz.Poul"%>
<%@page import="log.Log"%>
<!--
   Author: www.indsaccrm.com
   Author URL: https://www.indsaccrm.com
-->
<!doctype html>
<html lang="en">
  <head><link rel="shortcut icon" href="../dist/img/u.png" type="image/x-icon" />
        <link rel="canonical" href="https://www.indsaccrm.com/task.jsp" />
        <link rel="apple-touch-icon" href="dist/img/u.png"/>
        <link rel="alternate" hreflang="en" href ="https://www.indsaccrm.com/" />
        
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Task management is the process of effective allocation and distribution of tasks in an organization for increased professional and personal productivity">


    <title>Task Management | Best CRM Software | Indsac Crm :: indsaccrm.com</title>

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
					 <li class="active">Task Management</li>
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
                    Task Management
                </h3> 

            </div>
            <div class="cwp4-two row">
            <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/indsac-task.gif" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                   
                    <p class="para">Task management is the process of effective allocation and distribution of tasks in an organization for increased professional and personal productivity. </p><br>
                       <p class="para"> This involves the proper management of various customer relationship management (CRM) functions and more abstract sales.</p><br>
                     <p class="para"> It helps in scheduling various tasks that come across service, sales, contact center, and other marketing functions.</p>
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
                    <h4>Why do you need to manage tasks?</h4>
                    <p class="para"> 1. To make sure that we get things done, in time. <br>
                    2. Make sure that regular tasks are not missed.<br> 
                    3. Measure the efficiency of employees. <br>
                    4. Bring in accountability of the team. <br>
                    5. Bring focus to your job.<br>
                    6. Organize your organization.</p>
                   </div>
	 <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/indsac-task1.gif" alt="product" class="img-responsive ">
            </div>
            </div>
            <br> <br> 
            <div class="left-text">
	<h3>How CRM helps in Better task management</h3>  <br> <br> 
	 <h4>1. CRM Notifications<h4> <br>
             <p class="para">   1. When the task is completed. <br>
2. If the task is pending. <br>
3. Automatic escalations to higher management, as per configuration done. </p> <br>
             
        <h4>2. Activity Logging and reporting.<h4><br>
<p class="para">1. Per hour cost of all the team members is already entered in the CRM.<br>
2. So when team members perform any kind of activity for any module, we can get the time and cost analysis easily. <br>
3. Also, logging activity is very simple, just a single click on the CRM interface.</p><br>

<h4>3. Tracking employees <h4><br>
<p class="para">1. We get all the details about the activities done by an employee.<br>
2. Not just the quantity of activity done, but also the quality and timeliness of the same.</p><br><br>
</div>
            
            <div class="container">
	
            <div class="cwp4-two row">
          
                <div class="cwp4-text col-xl-6">
                    <h4>Benefits of using task management </h4>
                    <p class="para"> 1. With the help of Gantt charts, it helps you monitor your progress and mark milestones to keep your project on schedule. <br><br>
                    2. Helps you to organize, assign, and prioritize tasks using color codes, all from a single platform.<br><br> 
                    3. Allows you to set goals, keep track of deliverables, and manage deadlines. <br><br>
                    4. Eliminates the need to remember all tasks yourself and keeps you on track with timely reminders. <br><br>
                    5. Customizable options help you work with what you find comfortable.<br><br>
                   </p>
                   </div>
	 <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/indsac-task3.gif" alt="product" class="img-responsive ">
            </div>
            </div>
            </div><br><br>
            
 <div class="text-center">
	<h3>INDSAC-CRM Tasks Management Feature</h3><br><br>
        <p class="para"> The tasks management feature allows you to create reminders in your customer accounts that sync with your calendar. 
            You can set up tasks for yourself or assign them to one of your team, and also send an email reminder. You can set up recurring tasks.
            Once a task is completed it will automatically be added to the activities timeline in your customer account.</p><br><br>
	</div>
<div class="row about-about">
	<div class="col-lg-4 col-md-6">
		<div class="about-grids">

<h4>Setting Reminders</h4>
<p class="para">Easily set reminders for tasks synchronized with your calendar to never miss a deadline and have a proactive approach. </p><br>
<div class="mt-3 about-list">
	
</div>
		</div>
	</div>
	<div class="col-lg-4 col-md-6 about-line-top">
		<div class="about-grids">
<h4>Assign Tasks </h4>

<p class="para">Set a task for yourself or assign it to different team members or colleagues across the organization.</p><br>
<div class="mt-3 about-list">
	
</div>
		</div>
	</div>
	<div class="col-lg-4 col-md-6 about-line-top">
		<div class="about-grids">
<h4> Email Integration</h4>
<p class="para">With email and CRM integration, you can manage all your communication through a unified platform. </p><br>
<div class="mt-3 about-list">

</div>
		</div>
	</div>
</div>           
   <div class="row about-about">
	<div class="col-lg-4 col-md-6">
		<div class="about-grids">

<h4>Map Out Your Workflow</h4>
<p class="para">This will make it easier to understand which tasks are completed, what needs to be done, and how different strategies will help you. You can also automate recurring tasks such as follow-ups from customers, different task alerts, and updating databases.</p>
<div class="mt-3 about-list">
	
</div>
		</div>
	</div>
	<div class="col-lg-4 col-md-6 about-line-top">
		<div class="about-grids">
<h4>Stay on Top of Your Day </h4>

<p class="para">A timeline of tasks can also be maintained for each customer or employee in the CRM software. 
    Hence, just when a task is completed, it will be automatically updated so your team can focus on the next important task.  </p><br>
<div class="mt-3 about-list">
	
</div>
		</div>
	</div>
	<div class="col-lg-4 col-md-6 about-line-top">
		<div class="about-grids">
<h4>Seamless Data Management</h4>
<p class="para">Stay updated with the current projects/leads/etc and keep track of performance by having a holistic view of the pipeline through your CRM dashboard. 
    Having easy access to data makes it user-intuitive and enables users to derive actionable insights. </p>
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
              + ", "+request.getRemoteHost()+", Leaving taskmanagement.jsp");
      %>
</body>

</html>