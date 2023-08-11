<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
	<title>EndGam - Gaming Magazine Template</title>
	<meta charset="UTF-8">
	<meta name="description" content="EndGam Gaming Magazine Template">
	<meta name="keywords" content="endGam,gGaming, magazine, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Favicon -->
	<link href="usertemplet/img/favicon.ico" rel="shortcut icon"/>

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i,900,900i" rel="stylesheet">


	<!-- Stylesheets -->
	<link rel="stylesheet" href="usertemplet/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="usertemplet/css/font-awesome.min.css"/>
	<link rel="stylesheet" href="usertemplet/css/slicknav.min.css"/>
	<link rel="stylesheet" href="usertemplet/css/owl.carousel.min.css"/>
	<link rel="stylesheet" href="usertemplet/css/magnific-popup.css"/>
	<link rel="stylesheet" href="usertemplet/css/animate.css"/>

	<!-- Main Stylesheets -->
	<link rel="stylesheet" href="usertemplet/css/style.css"/>


	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header section -->
	<tiles:insertAttribute name="header" />
	<!-- Header section end -->

	<!-- Body section -->
	<tiles:insertAttribute name="body" />
	<!-- Body section end -->

	<!-- Footer section -->
	<tiles:insertAttribute name="footer" />
	<!-- Footer section end -->


	<!--====== Javascripts & Jquery ======-->
	<script src="usertemplet/js/jquery-3.2.1.min.js"></script>
	<script src="usertemplet/js/bootstrap.min.js"></script>
	<script src="usertemplet/js/jquery.slicknav.min.js"></script>
	<script src="usertemplet/js/owl.carousel.min.js"></script>
	<script src="usertemplet/js/jquery.sticky-sidebar.min.js"></script>
	<script src="usertemplet/js/jquery.magnific-popup.min.js"></script>
	<script src="usertemplet/js/main.js"></script>

	</body>
</html>