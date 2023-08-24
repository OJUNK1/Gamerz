<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
tr td h2 {
	color: #4cde03;
	padding: 30px;
}
tr td h1 {
	color: #ee626b;
	padding: 20px;
}
#pdset{
	padding-left: 30px;
}
</style>
</head>
<body>

	<section class="page-top-section set-bg"
		data-setbg="usertemplet/img/images/bg-top-4.png">
		<div class="page-info">
			<h2>Cart</h2>
			<div class="site-breadcrumb">
				<a href="home.do">Home</a> / <span>Cart</span>
			</div>
		</div>
	</section>
	<!-- Page top end-->
	<div class="container">
		<div class="nk-store nk-store-cart">
			<div class="table-responsive">

				<!-- START: Products in Cart -->
				<table class="table nk-store-cart-products">
					<tbody>
						<!--  ITEM in Cart start -->
						<c:forEach items="${carts }" var="c">
						
						<c:if test="${c.cartPersonal == name }">
							<tr>
								<td class="nk-product-cart-thumb"><a
									href="javascript:selectGame(${c.gameId })" class="nk-image-box-1 nk-post-image">
										<img src="${c.gameIllustMini }" alt="" width="115">
								</a></td>
								<td class="nk-product-cart-title">
									<h5 class="h6" id="pdset">Product:</h5>
									<div class="nk-gap-1"></div>
									<h2 class="nk-post-title h4">
										<a href="javascript:selectGame(${c.gameId })">${c.gameName }</a>
									</h2>
								</td>

								<td class="nk-product-cart-price">
									<h5 class="h6">Price:</h5>
									<div class="nk-gap-1"></div> 
									<strong>${c.gamePrice }</strong>
								</td>

								<td class="nk-product-cart-quantity">
									<h5 class="h6">Discount:</h5> 
									<c:if test="${c.gamePriceDiscount == 0 }">
										<div class="nk-gap-1"></div>
										<strong> - </strong>
									</c:if> 
									<c:if test="${c.gamePriceDiscount != 0 }">
										<div class="nk-gap-1"></div>
										<strong> ${c.gamePrice - c.gamePriceDiscount } </strong>
									</c:if>
								</td>

								<td class="nk-product-cart-total">
									<h5 class="h6">Total:</h5> 
									<c:if test="${c.gamePriceDiscount == 0 }">
										<div class="nk-gap-1"></div>
										<strong>${c.gamePrice }원</strong>
									</c:if>
									<c:if test="${c.gamePriceDiscount != 0 }">
										<div class="nk-gap-1"></div>
										<strong>${c.gamePriceDiscount }원</strong>
									</c:if>
								</td>

								<td class="nk-product-cart-remove">
								<a href="cartitemdelete.do"> 
								<span class="ion-android-close">X</span>
								</a>
								</td>
							</tr>
						
						</c:if>
						</c:forEach>
						<c:if test="${empty carts && c.cartPersonal == name }">
							<tr>
								<td colspan="6" align="center"><h2>CAN PUT EVERYTHING
										TO HERE</h2></td>
							</tr>
							<tr>
								<td colspan="6" align="center"><h2>JUST ENJOY THE GAME
										IN LIFE ! ! !</h2></td>
							</tr>
						</c:if>
						<c:if test="${empty carts && empty id}">
							<tr>
								<td colspan="6" align="center">
								<h2>CAN USE EVERYTHING</h2></td>
							</tr>
							<tr>
								<td colspan="6" align="center">
								<h1>GAMERZ MEMBERZ !</h1></td>
							</tr>
						</c:if>
						<!--  ITEM in Cart end -->
					</tbody>
				</table>
				<c:if test="${empty carts && not empty id}">
					<div class="nk-gap-1"></div>
					<a class="btn btn-primary btn-round btn-marquee float-right"
						href="promotion.do">GO LIFE ! DO GAME !</a>
				</c:if>
				<c:if test="${empty carts && empty id}">
					<div class="nk-gap-1"></div>
					<a class="btn btn-primary btn-round btn-marquee float-right"
						href="promotion.do">GO LOGIN ! DO SIGNUP !</a>
					
				</c:if>
				<!-- END: Products in Cart -->
			</div>
			<c:if test="${not empty carts && not empty id}">
				<div class="nk-gap-1"></div>
				<a class="nk-btn nk-btn-rounded nk-btn-color-white float-right"
					href="#">Update Cart</a>

				<div class="clearfix"></div>
				<div class="nk-gap-2"></div>
				<div class="row vertical-gap">
					<div class="col-md-6">

						<!-- START: Calculate Shipping -->

						<div class="section title text-white">
							<h4>CALCULATE SHIPPING</h4>
							<div class="nk-gap-1"></div>
						</div>

						<form action="#" class="nk-form">
							<label for="country-sel">Country <span
								class="text-main-1">*</span>:
							</label> <select name="country" class="form-control required"
								id="country-sel">
								<option value="">Select a country...</option>
							</select>

							<div class="nk-gap-1"></div>
							<div class="row vertical-gap">
								<div class="col-sm-6">
									<label for="state">State / Country <span
										class="text-main-1">*</span>:
									</label> <input type="text" class="form-control required" name="state"
										id="state">
								</div>
								<div class="col-sm-6">
									<label for="zip">Postcode / ZIP <span
										class="text-main-1">*</span>:
									</label> <input type="tel" class="form-control required" name="zip"
										id="zip">
								</div>
							</div>

							<div class="nk-gap-1"></div>
							<a class="nk-btn nk-btn-rounded nk-btn-color-white float-right"
								href="#">Update Totals</a>
						</form>
						<!-- END: Calculate Shipping -->

					</div>
					<div class="col-md-6">
						<!-- START: Cart Totals -->
						<div class="section title text-white">
							<h4>CART TOTALS</h4>
							<div class="nk-gap-1"></div>
						</div>
						<table class="nk-table nk-table-sm">
							<tbody>
								<tr class="nk-store-cart-totals-subtotal">
									<td>First Cost</td>
									<td>itemPrice합 원</td>
								</tr>
								<tr class="nk-store-cart-totals-shipping">
									<td>Total Discount Price</td>
									<td>itemSale합 원</td>
								</tr>
								<tr class="nk-store-cart-totals-total">
									<td>Total</td>
									<td>g.gamePrice 원</td>
								</tr>
							</tbody>
						</table>
						<!-- END: Cart Totals -->
					</div>
				</div>

				<div class="nk-gap-2"></div>
				<a class="nk-btn nk-btn-rounded nk-btn-color-main-1 float-right"
					href="store-checkout.html">Proceed to Checkout</a>
				<div class="clearfix"></div>
			</c:if>
		</div>
	</div>

	<div class="nk-gap-2"></div>
	<div>
		<form id="gamefrm" action="gameinfo.do" method="post">
			<input type="hidden" id="gameId" name="gameId">
		</form>
	</div>
	
	
</body>
</html>