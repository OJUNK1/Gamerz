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
	<!-- Page top section -->
	<section class="page-top-section set-bg"
		data-setbg="usertemplet/img/page-top-bg/1.jpg">
		<div class="page-info">
			<h2>Games</h2>
			<div class="site-breadcrumb">
				<a href="home.do">Home</a> / <span>Games</span>
			</div>
		</div>
	</section>
	<!-- Page top end-->


	<!-- Games section -->
	<section class="games-single-page">
		<div class="container">
			<div class="game-single-preview">
				<img src="${g.gameIllustMain }" alt="">
			</div>
			<div class="row">
				<div class="col-xl-9 col-lg-8 col-md-7 game-single-content">
					<div class="gs-meta">
						11.11.18 / in <a href="gamelibrary.do">Games</a>
					</div>
					<h2 class="gs-title">${g.gameName }</h2>
					<h4>게임설명(그림, 영상)</h4>
					<p>${g.gameVideo }</p>
					<h4>게임설명</h4>
					<p>${g.gameDetailAbout }</p>
				</div>
				<div class="col-xl-3 col-lg-4 col-md-5 sidebar game-page-sideber">
					<div id="stickySidebar">
						<div class="widget-item">
							<div class="rating-widget">
								<h4 class="widget-title">info</h4>
								<ul>
									<li>가격<span>${g.gamePrice }원</span></li>
									<li>출시일<span>${g.gameReleaseDate }</span></li>
									<li>장르<span>${g.gameGenre }</span></li>
									<li>개발사<span>${g.gameDeveloper }</span></li>
									<li>플랫폼<span>${g.gamePlatform }</span></li>
								</ul>
								<form id="qty" action="#">
									<button type="submit">
										<i class="fa fa-shopping-bag"></i> ADD TO CART
									</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Games end-->
	
	<section class="game-author-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="anime__details__review">
						<div class="section-title">
							<h5>Reviews</h5>
						</div>
						<form id="reviewfrm" action="review.do" method="post">
							<c:forEach items="${reviewlist }" var="r">
								<div class="anime__review__item">
									<div class="anime__review__item__pic">
										<img src="usertemplet/img/review/1.jpg" alt="">
									</div>

									<div class="anime__review__item__text">
										<h6>
											${r.memberName } - <span>${r.reviewDate }</span>
										</h6>
										<p>${r.reviewComment }</p>
									</div>
								</div>
							</c:forEach>
						</form>
					</div>
					<div class="anime__details__form">
						<div class="section-title">
							<h5>Your Comment</h5>
						</div>
						<form action="">
							<textarea placeholder="Your Comment"></textarea>
							<button type="submit">
								<i class="fa fa-location-arrow"></i> Review
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>