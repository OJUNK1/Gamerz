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
	<section class="page-top-section set-bg"
		data-setbg="usertemplet/img/page-top-bg/1.jpg">
		<div class="page-info">
			<h2>Games</h2>
			<div class="site-breadcrumb">
				<a href="home.do">Home</a> / <span>Games</span>
			</div>
		</div>
	</section>
	<!-- Games section -->
	<section class="games-section">
		<div class="container">

			<div class="row">
				<div class="col-xl-7 col-lg-8 col-md-7">
					<div class="row">
						<c:forEach items="${games }" var="g">
							<c:if test="${g.gameClassfication == 'popular' }">

								<div class="col-lg-4 col-md-6">
									<div class="game-item">
										<img src="${g.gameIllustMini }" alt="#">
										<h5>${g.gameName }</h5>
										<a href="javascript:selectGame(${g.gameId })"
											class="read-more">Read More <img
											src="usertemplet/img/icons/double-arrow.png" alt="#" /></a>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="site-pagination">
						<a href="#" class="active">01.</a> <a href="#">02.</a> <a href="#">03.</a>
					</div>
				</div>
				<div class="col-xl-3 col-lg-4 col-md-5 sidebar game-page-sideber">
					<div id="stickySidebar">
						<div class="widget-item">
							<div class="categories-widget">
								<h4 class="widget-title">Genre</h4>
								<ul>
									<li><a href="">액션</a></li>
									<li><a href="">어드벤처</a></li>
									<li><a href="">롤플레잉</a></li>
									<li><a href="">스포츠</a></li>
									<li><a href="">전략</a></li>
								</ul>
							</div>
						</div>
						<div class="widget-item">
							<div class="categories-widget">
								<h4 class="widget-title">platform</h4>
								<ul>
									<li><a href="">Xbox</a></li>
									<li><a href="">X box 360</a></li>
									<li><a href="">Play Station</a></li>
									<li><a href="">Play Station VR</a></li>
									<li><a href="">Nintendo Wii</a></li>
									<li><a href="">Nintendo Wii U</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div>
			<form id="gamefrm" action="gameinfo.do" method="post">
				<input type="hidden" id="gameId" name="gameId">
			</form>
		</div>
	</section>
	<!-- Games end-->
	<script type="text/javascript">
		function selectGame(n) {
			document.getElementById("gameId").value = n;
			document.getElementById("gamefrm").submit();
		}
	</script>
</body>
</html>