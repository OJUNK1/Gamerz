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
				<a href="home.do">Home</a> / FAQ
			</div>
		</div>
	</section>
	<!-- Page top end-->
	<!-- Table Section -->
	<section class="review-section">
		<div class="container">
			<div align="center">
				<div>
					<h2 class="text-white">게시글 수정</h2>
				</div><br>
				<div>
					<form id="frm" action="reqedit.do" method="post">
						<div style="background-color: white;">
							<table class="table table-bordered">
								<tr>
									<th width="100">작성자</th>
									<td><input type="text" id="reqWriter" name="reqWriter"
										value="${r.reqWriter }" readonly="readonly" /></td>
									<th width="100">작성일자</th>
									<td><input type="date" id="reqDate" name="reqDate"
										value="${r.reqDate }" /></td>
								</tr>
								<tr>
									<th>제목</th>
									<td colspan="3"><input size="125" type="text" id="reqTitle"
										name="reqTitle" value="${r.reqTitle }" /></td>
								</tr>
								<tr>
									<th>내용</th>
									<td colspan="3"><textarea id="reqSubject"
											name="reqSubject" cols="125" rows="20">${r.reqSubject }</textarea>
									</td>
								</tr>
							</table>
						</div>
						<br>
						<div>
							<button class="site-btn" type="submit">
								수정 <img src="usertemplet/img/icons/double-arrow.png" alt="#" />
							</button>
							&nbsp;&nbsp;&nbsp;
							<button class="site-btn" type="button"
								onclick="location.href='reqlist.do'">
								취소 <img src="usertemplet/img/icons/double-arrow.png" alt="#" />
							</button>
						</div>
						<input type="hidden" id="reqId" name="reqId" value="${r.reqId }" />
					</form>
					<div></div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>