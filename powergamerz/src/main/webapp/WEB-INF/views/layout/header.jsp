<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header class="header-section">
		<div class="header-warp">
			<div class="header-social d-flex justify-content-end">
				<p>Follow us:</p>
				<a href="#"><i class="fa fa-pinterest"></i></a> <a href="#"><i
					class="fa fa-facebook"></i></a> <a href="#"><i
					class="fa fa-twitter"></i></a> <a href="#"><i
					class="fa fa-dribbble"></i></a> <a href="#"><i
					class="fa fa-behance"></i></a>
			</div>
			<div class="header-bar-warp d-flex">
				<!-- site logo -->
				<a href="home.do" class="site-logo"> <img
					src="usertemplet/img/logo.jpg" alt="">
				</a>
				<nav class="top-nav-area w-100">
					<div class="user-panel">
						<a href="">Login</a> / <a href="">Register</a>
					</div>
					<!-- Menu -->
					<ul class="main-menu primary-menu">
						<li><a href="home.do">Home</a></li>
						<li><a href="games.html">Games</a>
							<ul class="sub-menu">
								<li><a href="game-single.html">Latest Games</a></li>
								<li><a href="game-single.html">Popular Games</a></li>
								<li><a href="game-single.html">Coming Soon</a></li>
								<li><a href="game-single.html">Games Library</a></li>
								<li><a href="">인디게임</a></li>
							</ul></li>
						<li><a href="review.html">Promotion</a></li>
						<li><a href="contact.html">Community</a>
							<ul class="sub-menu">
								<li><a href="">Discussions</a></li>
							</ul></li>
						<li><a href="support.do">Support</a>
							<ul class="sub-menu">
								<li><a href="faq.do">FAQ</a></li>
								<li><a href="contactus.do">Contact Us</a>
							</ul>
						<li><a href="about.do">About</a>
							<ul class="sub-menu">
								<li><a href="aboutgamerz.do">About Gamerz</a>
								<li><a href="news.do">News(공지)</a>
							</ul>
				</nav>
			</div>
		</div>
	</header>
</body>
</html>