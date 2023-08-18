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
	<section class="review-section">
		<div class="container">
			<div align="center">
				<div>
					<div style="background-color:white">
						<table class="table table-bordered" >
							<tr>
								<th width="100">작성자</th>
								<td align="center">${p.postWriter }</td>
								<th width="100">작성일자</th>
								<td align="center">${p.postCreateDate }</td>
								<th width="100">조회수</th>
								<td align="center">${p.postHit }</td>
							</tr>
							<tr>
								<th>제목</th>
								<td colspan="5">${p.postTitle }</td>
							</tr>
							<tr>
								<td colspan="6">
								<c:if test="${not empty p.postAttach }">
								<img src="attach/post/${p.postAttach }" style="width:500px; height:300px;">
								</c:if>
								${p.postSubject }
								</td>
							</tr>
						</table>
					</div>
					<br>
					<div>
						<c:if test="${name eq p.postWriter }">
							<button type="button" onclick="postUpdate('E')">수정</button>&nbsp;&nbsp;&nbsp;
							<button type="button" onclick="postUpdate('D')">삭제</button>&nbsp;&nbsp;&nbsp;			
						</c:if>
						<button type="button" onclick="location.href='postlist.do'">목록</button>
					</div>
					<div>
						<form id="frm" method="post">
							<input type="hidden" id="postId" name="postId"
								value="${p.postId }" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
		function noticeUpdate(str) {
			if (str == 'E') {
				document.getElementById("frm").action = "posteditform.do";
			} else {
				document.getElementById("frm").action = "postdelete.do";
			}

			document.getElementById("frm").submit();
		}
	</script>



</body>
</html>