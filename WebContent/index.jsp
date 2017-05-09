<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- This document has been created with the use of the grayscale template from startbootstrap.com under the apache
2.0 liscense-->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Weather Tracker</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">

<!-- Theme CSS -->
<link href="css/grayscale.min.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #floating-panel {
        position: relative;
        top: 10px;
        left: 0%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        color:black;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
    </style>
</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

	<!-- Navigation -->
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-main-collapse">
				Menu <i class="fa fa-bars"></i>
			</button>
			<a class="navbar-brand page-scroll" href="#page-top"> <i
				class="fa fa-play-circle"></i> <span class="light">Flight</span>
				Planner
			</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div
			class="collapse navbar-collapse navbar-right navbar-main-collapse">
			<ul class="nav navbar-nav">
				<!-- Hidden li included to remove active class from about link when scrolled up past about section -->
				<li class="hidden"><a href="#page-top"></a></li>
				<li><a class="page-scroll" href="#plan">Plan A Flight</a></li>
				<li><a class="page-scroll" href="#map">Map</a></li>
				<li><a class="page-scroll" href="#advisory">Advisory</a></li>
				<li><a class="page-scroll" href="#contact">Contact</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

	<!-- Intro Header -->
	<header class="intro">
	<div class="intro-body">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h1 class="brand-heading">Flight Planner</h1>
					<p class="intro-text">
						A Free Web App that helps user plan a trip by flight <br>Created
						by BBJ Weather Inc
					</p>
					<a href="#plan" class="btn btn-circle page-scroll"> <i
						class="fa fa-angle-double-down animated"></i>
					</a>
				</div>
			</div>
		</div>
	</div>
	</header>

	<section id="plan" class="container content-section text-center">
	<div class="row">
		<div class="col-lg-8 col-lg-offset-2">
			<h2>Plan a flight</h2>
			<p>Please Enter Flight data</p>
			<form >
				<fieldset>
					<input type="text" name="airport1" value="Start Point"
						id="airport1" style="color: black" /> <input type="text"
						name="airport2" value="End Point" id="airport2"
						style="color: black" />
				</fieldset>
				<input type="submit" value="submit" id="submit" style="color: black" />
			</form>
		</div>
	</div>
	</section>
<!-- 	<div id="floating-panel"> -->
<!--     <b>Start: </b> -->
<!--     <input type="text" id="start" value="bwi"/> -->
<!--     <b>End: </b> -->
<!--   <input type="text" id="end"/> -->
<!--     </div> -->
	
	<div id="map"></div>
	  <div id="floating-panel">
    <b>Start: </b>
    <input type="text" id="start" value="bwi"/>
    <b>End: </b>
  <input type="text" id="end"/>
    </div>
	<script>
      function initMap() {
        var directionsService = new google.maps.DirectionsService;
        var directionsDisplay = new google.maps.DirectionsRenderer;
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 7,
          center: {lat: 41.85, lng: -87.65}
        });
        directionsDisplay.setMap(map);

        var onChangeHandler = function() {
          calculateAndDisplayRoute(directionsService, directionsDisplay);
        };
        document.getElementById('start').addEventListener('change', onChangeHandler);
        document.getElementById('end').addEventListener('change', onChangeHandler);
      }

      function calculateAndDisplayRoute(directionsService, directionsDisplay) {
        directionsService.route({
          origin: document.getElementById('start').value,
          destination: document.getElementById('end').value,
          travelMode: 'DRIVING'
        }, function(response, status) {
          if (status === 'OK') {
            directionsDisplay.setDirections(response);
          } else {
            window.alert('Directions request failed due to ' + status);
          }
        });
      }
    </script>

	<!-- Download Section -->
	<section id="advisory" class="content-section text-center">
	<div class="download-section">
		<div class="container">
			<div class="col-lg-8 col-lg-offset-2">
				<h2>Flight Advisory</h2>
				<p>Your Flight date is</p>
				<p>Your trip time should be</p>
				<p>Delay</p>
				<p>Current Weather and predictions</p>
				<p>What to wear</p>

			</div>
		</div>
	</div>
	</section>

	<!-- Contact Section -->
	<section id="contact" class="container content-section text-center">
	<div class="row">
		<div class="col-lg-8 col-lg-offset-2">
			<h2>Contact us</h2>
			<p>
				<a href="#">feedback@flightplanner.com</a>
			</p>
			<ul class="list-inline banner-social-buttons">
				<li><a href="#"
					class="btn btn-default btn-lg"><i class="fa fa-twitter fa-fw"></i>
						<span class="network-name">Twitter</span></a></li>
				<li><a href="#"
					class="btn btn-default btn-lg"><i class="fa fa-github fa-fw"></i>
						<span class="network-name">Github</span></a></li>
				<li><a href="#"
					class="btn btn-default btn-lg"><i
						class="fa fa-google-plus fa-fw"></i> <span class="network-name">Google+</span></a>
				</li>
			</ul>
		</div>
	</div>
	</section>

	<!-- Map Section -->
	<div id=""></div>

	<!-- Footer -->
	<footer>
	<div class="container text-center">
		<p>Copyright &copy; Flight planner 2016</p>
	</div>
	</footer>

	<!-- jQuery -->
	<script src="vendor/jquery/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

	<!-- Theme JavaScript -->
	<script src="js/grayscale.min.js"></script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCYL5A6ZTQ3PxBGIJVFhyMvF3KunkTY0-Q&callback=initMap">
    </script>
</body>

</html>
