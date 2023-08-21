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
		<div class="container" align="center">
		<div><h2 class="text-white">자유게시판 목록</h2></div>
		<div align="right">
		<form id="searchfrm">
			<select name="key" id="key">
				<option value="title">제목</option>
				<option value="subject">내용</option>
				<option value="writer">작성자</option>
			</select>&nbsp;&nbsp;
			<input type="text" id="val" name="val" />
			<input type="button" onclick="searchlist()" value="검색" />
		</form>
		</div><br>
		<table class="table table-light table-striped table-hover">
			<thead>
				<tr>
					<th width="100">순번</th>
					<th width="100">사진</th>
					<th width="250">제목</th>
					<th width="100">작성자</th>
					<th width="100">작성일자</th>
					<th width="100">조회수</th>
				</tr>
			</thead>	
			<tbody>
			<c:if test="${not empty posts }">
				<c:forEach items="${posts }" var="d">
				<tr onclick="selectPost(${d.postId })">
					<td>${d.postId }</td>
					<c:if test="${not empty d.postAttach }">
						<td><img src="attach/post/${d.postAttach }" style="width:100px; height:100px;"></td>
					</c:if>
					<c:if test="${empty d.postAttach }">
						<td><img src="attach/post/noimg.jpg" style="width:100px; height:100px;"></td>
					</c:if>
					<td>${d.postTitle }</td>
					<td>${d.postWriter }</td>
					<td>${d.postCreateDate }</td>
					<td>${d.postHit }</td>
				</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty posts }">
				<tr>
					<td colspan="6" align="center">데이터가 존재하지 않습니다.</td>
				</tr>
			</c:if>
			</tbody>
		</table>		
	<div align="right">
		<button class="btn btn-light" type="button" onclick="location.href='postform.do'">글쓰기</button>
	</div>
	</div>
	<div>
		<form id="postfrm" method="post">
			<input type="hidden" id="postId" name="postId" value="${d.postId }" />
		</form>
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
 		document.querySelector('tbody').remove();
 		const tbody = document.createElement('tbody');
 		// tbody에 데이터 추가
 		tbody.innerHTML = datas.map(data=>htmlView(data)).join('');
 		// table 테그에 tbody 추가
 		document.querySelector('table').appendChild(tbody);
 	}
 	
 	function htmlView(data){
 		return `
			<tr onclick="selectPost(\${data.postId})">
		 		<td>\${data.postId }</td>
				<td><img src="attach/post/\${data.postAttach }" style="width:100px; height:100px;"></td>
				<td>\${data.postTitle }</td>
				<td>\${data.postWriter }</td>
				<td>\${data.postCreateDate }</td>
				<td>\${data.postHit }</td>
			</tr>
 		`
 	}
</script>
</section>
<!-- Review section end-->
</body>
</html>