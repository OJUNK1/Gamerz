<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<style>
select {
  width: 200px; /* 원하는 너비설정 */
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
		<div class="container" id="parent">
		<!-- 검색창 영역 -->
		<div><h2 class="text-white">자유게시판</h2></div><br>
		<div>
		<form id="searchfrm" class="newsletter-form">
			<select name="key" id="key" style="height:30px;">
				<option value="title">제목</option>
				<option value="subject">내용</option>
				<option value="writer">작성자</option>
			</select><br>
			<input type="text" id="val" name="val" placeholder="검색할 내용입력" />
			<button type="button" onclick="searchlist()" class="site-btn">검색  <img src="usertemplet/img/icons/double-arrow.png" alt="#"/></button> 
		</form>
		</div><br>
		<!-- 검색창 영역 end -->
		<div id="contents-p">
		<div id="contents">
		<c:if test="${not empty posts }">
			<c:forEach items="${posts }" var="d">			
				<div class="review-item" >
					<div class="row">
						<div class="col-lg-4">
							<div class="review-pic">
							<c:if test="${not empty d.postAttach}">
								<img src="attach/post/${d.postAttach }">
							</c:if>
							<c:if test="${empty d.postAttach}">
								<img src="attach/post/noimg.jpg">
							</c:if>
							</div>
						</div>
						<div class="col-lg-8">
							<div class="review-content text-box text-white">
								<div class="top-meta">${d.postCreateDate } /  작성자 <a href="">${d.postWriter }</a></div>
								<h3>${d.postTitle }</h3>
								<p>content</p>
								<a href="#" onclick="selectPost(${d.postId })" class="read-more">Read More  <img src="usertemplet/img/icons/double-arrow.png" alt="#"/></a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
		</div>
		</div>
			<div class="site-pagination">
				<a href="#" class="active">01.</a>
				<a href="#">02.</a>
				<a href="#">03.</a>
			</div>
			
			<div align="right">
				<button class="site-btn" type="button" onclick="location.href='postform.do'">글쓰기 <img src="usertemplet/img/icons/double-arrow.png" alt="#"/></button>
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
								<img src="attach/post/\${data.postAttach }">
							</div>
						</div>
						<div class="col-lg-8">
							<div class="review-content text-box text-white">
								<div class="top-meta">\${data.postCreateDate } /  작성자 <a href="">\${data.postWriter }</a></div>
								<h3>\${data.postTitle }</h3>
								<p>\${data.postSubject }</p>
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