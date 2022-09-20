<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/index.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
<meta charset="UTF-8">
<title>CodeRoom</title>
</head>
<body>
<nav class="navbar navbar-expand-xl navbar-dark mynav" style="background-color: #333333;">
  <div class="container-fluid">
    <a class="navbar-brand" href="/dashboard"> <img  class="coderoom_icon"  src="/img/coderoom.png"/>  </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarDark" aria-controls="navbarDark" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class=" show middle-nav" id="navbarLight">
      <ul class="navbar-nav me-auto mb-2 mb-xl-0 middle-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Features</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Pricing</a>
        </li>
      </ul>
    </div>
		<a class="navbar-brand" href="/dashboard"><button type="button" class="btn btn-outline-secondary">Login</button> </a>
  </div>
</nav>

<div class="main_div">
	<div class="main_inner">
		<h1>CodeRoom</h1>
		<br/>
		<h3>When Coding Meets AI</h3>
		<p>CodeRoom is an online code editor with time complexity calculator and auto-annotation. You can also create Rooms to storage your code. Or you are able to generate code by AI. your Happy Coding!
		<br/><br/>
		<a class="navbar-brand" href="/dashboard"><button type="button" class="btn btn-outline-secondary">Login</button> </a>
	</div>
</div>
<div class="middle_div">
   <h2>Meet Our Alumni</h2>
</div>



<section class="main_div2">
	    <div class="swiper-container mySwiper">
      <div class="swiper-wrapper">

         
        <div class="swiper-slide">
        	<div class="user-card">
        		<div class="upper-card">
        			<h5 class="jobtitle">Full Stack Engineer</h5>
        		</div>
        		<div class="lower-card">
		         	<div>
			         	<img class="myicon" src="/img/83.png" />
		         	
		         	</div>
		         	<div class="card_info">
		         		<h6 class="name">ChienHsin Chung</h6>
		         		<br/>
		         		<p>Using code room makes my life much easier. Code room let me have more time to watch Netflex.</p>
		         	</div>
        			
        		</div>
        	</div>	
        </div>
        
        <div class="swiper-slide">
        	<div class="user-card">
        		<div class="upper-card">
        			<h5 class="jobtitle">Staff Engineer</h5>
        		</div>
        		<div class="lower-card">
		         	<div>
			         	<img class="myicon" src="/img/2.jpg" />
		         	
		         	</div>
		         	<div class="card_info">
		         		<h6 class="name">Guido van Rossum</h6>
		         		<br/>
		         		<p>I love the annotation function, it let me understand others' code in a short time.</p>
		         	</div>
        			
        		</div>
        	</div>	
        </div>
        
        <div class="swiper-slide">
        	<div class="user-card">
        		<div class="upper-card">
        			<h5 class="jobtitle">Beginner</h5>
        		</div>
        		<div class="lower-card">
		         	<div>
			         	<img class="myicon" src="/img/3.jpeg" />
		         	
		         	</div>
		         	<div class="card_info">
		         		<h6 class="name">SpongeBob</h6>
		         		<br/>
		         		<p>Very friendly for beginner, love the time complexity calculator.</p>
		         	</div>
        			
        		</div>
        	</div>	
        </div>
        


  		</div>
    </div>
</section>

<div class="bottom_div">
	<div class="bottom_subdiv">
		<h4>Explore</h4>
		<p>New Features</p>
		<p>Featured coderoom</p>
	</div>
	
	<div class="bottom_subdiv">
		<h4>About</h4>
		<p>Pricing</p>
		<p>Jobs</p>
		<p>Our Team</p>
	</div>
	
	<div class="bottom_subdiv">
		<h4>Support</h4>
		<p>Documentation</p>
		<p>Contact support</p>
		<p>Status</p>
	</div>

</div>
<div class="last">

	<p class="bottom_p">Copyright © 2022 ChienHsin Chung · Privacy · Terms ·</p>
</div>

	
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<script>
      var swiper = new Swiper(".mySwiper", {
        effect: "coverflow",
        grabCursor: true,
        centeredSlides: true,
        slidesPerView: "auto",
        coverflowEffect: {
          rotate: 50,
          stretch: 0,
          depth: 100,
          modifier: 1,
          slideShadows: true,
        },
        pagination: {
          el: ".swiper-pagination",
        },
      });
    </script>
</body>
</html>