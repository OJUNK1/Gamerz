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
				<div>
					<h2 class="text-white">1:1문의 작성</h2>
				</div>
				<br>
				<div>
					<form id="qnafrm" action="qnainsert.do" method="post">
						<div style="background-color: white;">
							<table class="table table-bordered">
								<tr>
									<th width="100">작성자</th>
									<td><input type="text" id="qnaWriter" name="qnaWriter"
										value="test" readonly="readonly" /></td>
									<th width="100">작성일자</th>
									<td><input type="date" id="qnaDate" name="qnaDate"
										required="required" /></td>
								</tr>
								<tr>
									<th>제목</th>
									<td colspan="3"><input type="text" size="125" id="qnaTitle"
										name="qnaTitle" required="required" /></td>
								</tr>
								<tr>
									<th>내용</th>
									<td colspan="3"><textarea id="qnaSubject"
											name="qnaSubject" cols="125" rows="20"></textarea></td>
								</tr>
							</table>
						</div>
						<br> <input type="hidden" id="qnaWriterId" name="qnaWriterId"
							value="testId">
						<div align="right">		
							<button  type="submit" class="btn btn-primary btn-lg btn-jelly">작성</button>&nbsp;
							<button  type="submit" class="btn btn-danger btn-lg btn-jelly">취소</button>
						</div>
						<br>
					</form>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
	document.getElementById('qnaDate').value = new Date().toISOString().substring(0, 10);;
	</script>
</body>
</html>