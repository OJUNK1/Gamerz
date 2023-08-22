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
		data-setbg="usertemplet/img/page-top-bg/2.jpg">
		<div class="page-info">
			<h2>Community</h2>
			<div class="site-breadcrumb">
				<a href="home.do">Home</a> / Discussion
			</div>
		</div>
	</section>
	<!-- Page top end-->

	<!-- Review section -->
	<section class="review-section">
		<div class="container">
			<!-- 검색창 영역 -->
			<div>
				<h2 class="text-white">자유게시판</h2>
			</div>
			<br>
			<div>
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
			<!-- 검색창 영역 end -->
			<div id="contents-p">
				<div id="contents">
					<c:if test="${not empty posts }">
						<c:forEach items="${postpages }" var="d">
							<div class="review-item">
								<div class="row">
									<div class="col-lg-4">
										<div class="review-pic">
											<c:if test="${not empty d.postAttach}">
												<img src="attach/post/${d.postAttach }" height="300"
													width="400">
											</c:if>
											<c:if test="${empty d.postAttach}">
												<img src="attach/post/noimg.jpg" height="300" width="400">
											</c:if>
										</div>
									</div>
									<div class="col-lg-8">
										<div class="review-content text-box text-white">
											<div class="top-meta">${d.postCreateDate }
												/ 작성자 <a href="">${d.postWriter }</a>
											</div>
											<h3>${d.postTitle }</h3>
											<p>content</p>
											<a href="#" onclick="selectPost(${d.postId })"
												class="read-more">Read More <img
												src="usertemplet/img/icons/double-arrow.png" alt="#" /></a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
			<!-- ============= 페이징 ===============  -->
			<div class="site-pagination" id="pagination">
				<c:forEach var="num" begin="${pagingVO.startPage }"
					end="${pagingVO.endPage }">
					<a href="postlist.do?pageNum=${num}&amount=${pagingVO.amount}"
						class="${pagingVO.pageNum eq num ? 'active' : '' }">${num}</a>
				</c:forEach>
			</div>
			<!-- ============= 페이징 끝 ===============  -->

			<div align="right">
				<button class="site-btn" type="button"
					onclick="location.href='postform.do'">
					글쓰기 <img src="usertemplet/img/icons/double-arrow.png" alt="#" />
				</button>
			</div>
			<div>
				<form id="postfrm" method="post">
					<input type="hidden" id="postId" name="postId" value="${d.postId }" />
				</form>
			</div>
		</div>

		<script type="text/javascript">
	function selectPost(p){
		document.getElementById("postId").value = p;
		document.getElementById("postfrm").action ="postselect.do"; 
		document.getElementById("postfrm").submit();
	}
	
 	function searchlist(){
		//ajax를 이용해서 검색결과를 가져오고 화면을 재구성한다
 		let key = document.getElementById("key").value;
		let val = document.getElementById("val").value;
		let payload = "key="+key+"&val="+val;
		let url = "ajaxpostsearch.do";
		
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
		var myDiv = document.getElementById("contents");
		var parent = myDiv.parentElement;
		parent.removeChild(myDiv);
  		
		var newDiv = document.createElement("div");
		newDiv.id = 'contents';
 		// tbody에 데이터 추가
 		newDiv.innerHTML = datas.map(data=>htmlView(data)).join(''); 

		var p = document.getElementById("contents-p");
		p.appendChild(newDiv);
 	}
 	
  	function htmlView(data){
 		return `
		 <div class="review-item" >
					<div class="row">
						<div class="col-lg-4">
							<div class="review-pic">
								<img src="attach/post/\${data.postAttach }" height="300" width="400">
							</div>
						</div>
						<div class="col-lg-8">
							<div class="review-content text-box text-white">
								<div class="top-meta">\${data.postCreateDate } /  작성자 <a href="">\${data.postWriter }</a></div>
								<h3>\${data.postTitle }</h3>
								<p>content</p>
								<a href="#" onclick="selectPost(\${data.postId })" class="read-more">Read More  <img src="usertemplet/img/icons/double-arrow.png" alt="#"/></a>
							</div>
						</div>
					</div>
				</div>
 		`
 	} 
</script>
	</section>
	<!-- Review section end-->


</body>
</html>