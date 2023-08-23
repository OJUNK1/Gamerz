<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
				<a href="home.do">Home</a> / Contact Us
			</div>
		</div>
	</section>
	<!-- Page top end-->
		<!-- Table Section -->
	<section class="review-section">
		<div class="container">
<div align="center">
	<div><h2 class="text-white">Contact Us</h2></div><br>
	<div>
			<div style="background-color: white;">
				<table class="table table-bordered">
					<tr>
						<th width="100">작성자</th>
						<td align="center">${r.reqWriter }</td>
						<th width="100">작성일자</th>
						<td align="center">${r.reqDate }</td>
						<th width="100">답변여부</th>
						<td align="center">${r.reqDone }</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="5">
							${r.reqTitle }
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="5">
							<textarea id="reqSubject" name="reqSubject" cols="125" rows="20" readonly="readonly">${r.reqSubject }</textarea>
						</td>
					</tr>
				</table>
			</div><br>
			<div>
			<%-- <c:if test="${name eq p.postWriter }"> --%>
			<button type="button" class="site-btn" onclick="reqUpdate('E')">수정 <img src="usertemplet/img/icons/double-arrow.png" alt="#"/></button>&nbsp;&nbsp;&nbsp;
			<button type="button" class="site-btn" onclick="reqUpdate('D')">삭제 <img src="usertemplet/img/icons/double-arrow.png" alt="#"/></button>&nbsp;&nbsp;&nbsp;			
			<%-- </c:if> --%>
			<button type="button" class="site-btn" onclick="location.href='reqlist.do'">목록 <img src="usertemplet/img/icons/double-arrow.png" alt="#"/></button>
			</div>			
			<div>
				<form id="frm" method="post">
					<input type="hidden" id="reqId" name="reqId" value="${r.reqId }" />
				</form>
			</div>
	</div>
</div>
</div>
</section>
<script type="text/javascript">
	function reqUpdate(str){
		if(str=='E'){
			document.getElementById("frm").action = "reqeditform.do";
		}else{
			document.getElementById("frm").action = "reqdelete.do";
		}
		
		document.getElementById("frm").submit();
	}
</script>
</body>
</html>