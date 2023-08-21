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
		data-setbg="usertemplet/img/page-top-bg/3.jpg">
		<div class="page-info">
			<h2>Promotion</h2>
			<div class="site-breadcrumb">
				<a href="home.do">Home</a> / <span>Promotion</span>
			</div>
		</div>
	</section>
	<!-- Page top end-->

	<!--  Sale start -->
	<div class="section trending">
		<div class="container">
			<ul class="trending-filter">
				<li><a class="is_active" href="#!" data-filter="*">Show All</a>
				</li>
				<li><a class="is_active" href="#!" data-filter=".adv">adventure</a></li>
				<li><a class="is_active" href="#!" data-filter=".str">strategy</a></li>
				<li><a class="is_active" href="#!" data-filter=".rac">sports</a></li>
				<li><a class="is_active" href="#!" data-filter=".rac">role-playing</a></li>
				<li><a class="is_active" href="#!" data-filter=".rac">Action</a></li>
			</ul>
			<div class="row trending-box">
				<c:forEach items="${games }" var="g">
					<c:if test="${not empty games && not empty g.gamepriceDiscount}">

						<div
							class="col-lg-3 col-md-6 align-self-center mb-30 trending-items col-md-6 adv">
							<div class="item">
								<div class="thumb">
									<a href="product-details.html"><img
										src="${g.gameIllustMini }" alt=""></a> <span class="price"><em>${g.gamePrice }</em>${g.gamePriceDiscount }</span>
								</div>
								<div class="down-content">
									<span class="category">${g.gameGenre }</span>
									<h4>${g.gameName }</h4>
									<a href="javascript:selectGame(${g.gameId })"><i
										class="fa fa-shopping-bag"></i></a>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<div class="site-pagination">
				<a href="#" class="active">01.</a> <a href="#">02.</a> <a href="#">03.</a>
			</div>
		</div>
	</div>
	<div>
		<form id="gamefrm" action="gameinfo.do" method="post">
			<input type="hidden" id="gameId" name="gameId">
		</form>
	</div>
	<!--  Sale End -->
	<script type="text/javascript">
		function selectGame(n) {
			document.getElementById("gameId").value = n;
			document.getElementById("gamefrm").submit();
		}
	</script>
</body>

</html>