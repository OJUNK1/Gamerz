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
				<a href="home.do">Home</a> / <a>${g.gameGenre }</a> / <span>${g.gameName  }</span>
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
								<c:if test="${r.reviewLocation eq g.gameName }">

									<div class="anime__review__item">
										<div class="anime__review__item__pic">
											<img src="usertemplet/img/review/1.jpg" alt="">
										</div>

										<div class="anime__review__item__text">
											<h6>
												${r.memberName } - <span>${r.reviewDate }</span>
												<a class="general_btn panel_btn" href=""
													onclick="editReview()"> <img class="toolsIcon"
													src="https://community.akamai.steamstatic.com/public/images//sharedfiles/icons/icon_edit.png">
													Edit
												</a> <a class="general_btn panel_btn" href=""
													onclick="deleteReview()"> <img class="toolsIcon"
													src="https://community.akamai.steamstatic.com/public/images//sharedfiles/icons/icon_delete.png">
													Delete
												</a>
											</h6>
											<p>${r.reviewComment }</p>

										</div>
									</div>
								</c:if>
							</c:forEach>
						</form>
						<div>
							<form id="frm" method="post">
								<input type="hidden" id="reviewId" name="reviewId"
									value="${n.reviewId }">
							</form>
						</div>
					</div>
					<div class="anime__details__form">
						<div class="section-title">
							<h5>Your Comment</h5>
						</div>
						<form action="reviewinsert.do">
							<input type="hidden" name="reviewWriter" id="reviewWriter"
								value="이박사"> <input type="hidden" name="reviewLocation"
								id="reviewLocation" value="${g.gameName }">
							<textarea placeholder="Your Comment" id="reviewComment"
								name="reviewComment"></textarea>
							<button type="submit" onclick="location.href='reviewinsert.do'">
								<i class="fa fa-location-arrow"></i> Review
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
		function noticeUpdate(str) {
			if (str == 'D') {
				document.getElementById("frm").action = "reviewdelete.do"
			}

			document.getElementById("frm").submit();
		}
	</script>
</body>
</html>