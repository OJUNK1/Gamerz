<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Product Admin - Dashboard HTML Template</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<!-- https://fonts.google.com/specimen/Roboto -->
<link rel="stylesheet" href="css/fontawesome.min.css">
<!-- https://fontawesome.com/ -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- https://getbootstrap.com/ -->
<link rel="stylesheet" href="css/templatemo-style.css">
<!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
</head>

<body id="reportsPage">
	<div class="" id="home">
		<!-- Header section -->
		<tiles:insertAttribute name="header" />
		<!-- Header section end -->

		<!-- Body section -->
		<tiles:insertAttribute name="body" />
		<!-- Body section end -->

		<!-- Footer section -->
		<tiles:insertAttribute name="footer" />
		<!-- Footer section end -->
	</div>

	<script src="adminmaster/js/jquery-3.3.1.min.js"></script>
	<!-- https://jquery.com/download/ -->
	<script src="adminmaster/js/moment.min.js"></script>
	<!-- https://momentjs.com/ -->
	<script src="adminmaster/js/Chart.min.js"></script>
	<!-- http://www.chartjs.org/docs/latest/ -->
	<script src="adminmaster/js/bootstrap.min.js"></script>
	<!-- https://getbootstrap.com/ -->
	<script src="adminmaster/js/tooplate-scripts.js"></script>
	<script>
		Chart.defaults.global.defaultFontColor = 'white';
		let ctxLine, ctxBar, ctxPie, optionsLine, optionsBar, optionsPie, configLine, configBar, configPie, lineChart;
		barChart, pieChart;
		// DOM is ready
		$(function() {
			drawLineChart(); // Line Chart
			drawBarChart(); // Bar Chart
			drawPieChart(); // Pie Chart

			$(window).resize(function() {
				updateLineChart();
				updateBarChart();
			});
		})
	</script>
</body>

</html>