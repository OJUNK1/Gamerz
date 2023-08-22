<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<body>
	<header class="header-section">
		<div class="header-warp">
			<div class="header-bar-warp d-flex">
				<a href="home.do" class="site-logo"> <img
					src="usertemplet/img/logohead.png" alt="">
				</a>
				<nav class="top-nav-area w-100">
					<div class="user-panel">
						<div class="nk-contacts-top">
							<div class="container">

								<div class="nk-contacts-right">
									<ul class="nk-contacts-icons">

										<li><a href="#" data-toggle="modal"
											data-target="#modalSearch"> <span class="fa fa-search"></span>
										</a></li>
										<c:if test="${empty id}">
										<li><a href="logincontroller.do"> <span class="fa fa-user"></span>
										</a></li>
										</c:if>
										<c:if test="${not empty id}">
										<li><a href="#">my page	</a></li>
										<li><a href="logout.do"> log out </a></li>
										</c:if>
										
										<li><a href="cart.do"><span
												class="nk-cart-toggle"> <span
													class="fa fa-shopping-cart"></span>
											</span></a></li>
											<c:if test="${not empty id}">
										<li>${name}님 접속중</li>
										</c:if>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- Menu -->
					<ul class="main-menu primary-menu">
						<li><a href="home.do">Home</a></li>
						<li><a href="gamelibrary.do">Games</a>
							<ul class="sub-menu">
								<li><a href="latestgames.do">Latest Games</a></li>
								<li><a href="populargames.do">Popular Games</a></li>
								<li><a href="comingsoon.do">Coming Soon</a></li>
								<li><a href="gamelibrary.do">Games Library</a></li>
								<li><a href="indiegames.do">Indie Games</a></li>
							</ul></li>
						<li><a href="promotion.do">Promotion</a></li>
						<li><a href="postlist.do">Community</a>
							<ul class="sub-menu">
								<li><a href="postlist.do">Discussions</a></li>

							</ul></li>
						<li><a href="support.do">Support</a>
							<ul class="sub-menu">
								<li><a href="faq.do">FAQ</a></li>
								<li><a href="contactus.do">Contact Us</a>
							</ul>
						<li><a href="aboutus.do">About</a>
							<ul class="sub-menu">
								<li><a href="aboutus.do">About Gamerz</a>
								<li><a href="news.do">News(공지)</a>
							</ul>
				</nav>
			</div>
		</div>
	</header>
</body>
</html>