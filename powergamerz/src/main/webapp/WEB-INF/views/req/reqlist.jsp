<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
:root {
	--background-gradient: linear-gradient(30deg, #f39c12 30%, #f1c40f);
	--gray: #FFF;
	--darkgray: #FFF;
}

select {
	/* Reset Select */
	appearance: none;
	outline: 0;
	border: 0;
	box-shadow: none;
	/* Personalize */
	flex: 1;
	padding: 0 1em;
	color: #000;
	background-color: var(--darkgray);
	background-image: none;
	cursor: pointer;
}
/* Remove IE arrow */
select::-ms-expand {
	display: none;
}
/* Custom Select wrapper */
.select {
	position: relative;
	display: flex;
	width: 20em;
	height: 3em;
	border-radius: .25em;
	overflow: hidden;
}
/* Arrow */
.select::after {
	content: '\25BC';
	position: absolute;
	top: 0;
	right: 0;
	padding: 1em;
	background-color: #b01ba5;
	transition: .25s all ease;
	pointer-events: none;
}
/* Transition */
.select:hover::after {
	color: #fff;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- Page top section -->
	<section class="page-top-section set-bg"
		data-setbg="usertemplet/img/page-top-bg/4.jpg">
		<div class="page-info">
			<h2>Support</h2>
			<div class="site-breadcrumb">
				<a href="home.do">Home</a> / FAQ
			</div>
		</div>
	</section>
	<!-- Page top end-->

	<!-- table section -->
	<section class="review-section">
		<div class="container">
			<div>
				<div align="left">
					<form id="searchfrm" class="newsletter-form">
						<div class="select">
							<select name="key" id="key">
								<option value="title">제목</option>
								<option value="subject">내용</option>
								<option value="writer">작성자</option>
							</select>
						</div>
						<br> <input type="text" id="val" name="val"
							placeholder="검색할 내용입력" />
						<button type="button" onclick="searchlist()" class="site-btn">
							검색 <img src="usertemplet/img/icons/double-arrow.png" alt="#" />
						</button>
					</form>
				</div>
				<br>

				<table class="table table-light table-striped table-hover">
					<thead>
						<tr>
							<th width="100">순번</th>
							<th width="250">제목</th>
							<th width="100">작성자</th>
							<th width="100">작성일자</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty reqs }">
							<c:forEach items="${reqpages }" var="r">
								<tr onclick="selectFaq(${r.reqId })">
									<td>${r.reqId }</td>
									<td>${r.reqTitle }</td>
									<td>${r.reqWriter }</td>
									<td>${r.reqDate }</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty reqs }">
							<tr>
								<td colspan="4" align="center">데이터가 존재하지 않습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
				<!-- ============= 페이징 ===============  -->
				<div class="site-pagination" id="pagination">
					<c:forEach var="num" begin="${pagingVO.startPage }"
						end="${pagingVO.endPage }">
						<a href="faqlist.do?pageNum=${num}&amount=${pagingVO.amount}"
							class="${pagingVO.pageNum eq num ? 'active' : '' }">${num}</a>
					</c:forEach>
				</div>
				<!-- ============= 페이징 끝 ===============  -->
			</div>
			--%> <br>
			<div align="right">
				<%-- 		<c:if test="${not empty id }"> --%>
				<button type="button" class="site-btn"
					onclick="location.href='reqform.do'">글쓰기</button>
				<%-- 		</c:if> --%>
			</div>
			<div>
				<form id="reqfrm" method="post">
					<input type="hidden" id="reqId" name="reqId" />
				</form>
			</div>
		</div>
</section>
<!-- End Table Section -->
<script type="text/javascript">
	function selectFaq(n){
		document.getElementById("reqId").value = n;
		document.getElementById("reqfrm").action ="reqselect.do"; 
		document.getElementById("reqfrm").submit();
	}
	
 	function searchlist(){
		//ajax를 이용해서 검색결과를 가져오고 화면을 재구성한다
		let key = document.getElementById("key").value;
		let val = document.getElementById("val").value;
		let payload = "key="+key+"&val="+val;
		let url = "ajaxreqsearch.do";
		
		fetch(url,{
			method:"post",
			headers:{
				'content-type' :'application/x-www-form-urlencoded'
			},
			body: payload
		}).then(response => response.json())
		   .then(json => htmlConvert(json));
	} 
	
 	function htmlConvert(datas){
 		document.querySelector('tbody').remove();
 		const tbody = document.createElement('tbody');
 		// tbody에 데이터 추가
 		tbody.innerHTML = datas.map(data=>htmlView(data)).join('');
 		// table 테그에 tbody 추가
 		document.querySelector('table').appendChild(tbody);
 	}
 	
 	function htmlView(data){
 		return `
	 	<tr onclick="selectFaq(\${data.reqId })">
			<td>\${data.reqId }</td>
			<td>\${data.reqTitle }</td>
			<td>\${data.reqWriter }</td>
			<td>\${data.reqDate }</td>
		</tr>
 		`
 	}
</script>
		
</body>
</html>