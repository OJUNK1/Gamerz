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
				<a href="home.do">Home</a> / <span>Q&A</span>
			</div>
		</div>
	</section>
	<!-- Page top end-->
	<!-- Table Section -->
	<section class="review-section">
		<div class="container">
			<div align="center">
				<div>
					<h2 class="text-white">문의내용 수정</h2>
				</div>
				<br>
				<div>
					<form id="frm" action="qnaedit.do" method="post">
						<div style="background-color: white;">
							<table class="table table-bordered">
								<tr>
									<th width="100">작성자</th>
									<td><input type="text" id="qnaWriter" name="qnaWriter"
										value="${q.qnaWriter }" readonly="readonly" /></td>
									<th width="100">작성일자</th>
									<td><input type="date" id="qnaDate" name="qnaDate"
										value="${q.qnaDate }" /></td>
								</tr>
								<tr>
									<th>제목</th>
									<td colspan="3"><input size="125" type="text"
										id="qnaTitle" name="qnaTitle" value="${q.qnaTitle }" /></td>
								</tr>
								<tr>
									<th>내용</th>
									<td colspan="3"><textarea id="qnaSubject"
											name="qnaSubject" cols="125" rows="20">${q.qnaSubject }</textarea>
									</td>
								</tr>
							</table>
						</div>
						<br>
						<div>
							<button class="_1h8gH51Art N=a:qna.write" type="submit">
								수정 
							</button>
							&nbsp;&nbsp;&nbsp;
							<button class="_1h8gH51Art _228Dp2q_V1 N=a:qna.ask" type="button"
								onclick="location.href='qnalist.do'">
								취소 <img src="usertemplet/img/icons/double-arrow.png" alt="#" />
							</button>
						</div>
						<input type="hidden" id="qnaId" name="qnaId" value="${q.qnaId }" />
					</form>
					<div></div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>