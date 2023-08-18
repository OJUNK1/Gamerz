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
		<div class="container" style="background-color:white;">
			<form method="post" encType="multipart/form-data"
				action="postinsert.do" method="post">			
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeee; text-align: center;">게시판
								글쓰기 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="postTitle" maxlength="50" style="color:black;"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="postSubject" maxlength="2048" style="height: 350px; color:black;"></textarea></td>
						</tr>
						<tr>
							<td><input type="file" name="file"></td>
						</tr>
					</tbody>
				</table>
				<input type="hidden" id="postWriter" name="postWriter" value="test"/>
				<input type="hidden" id="postWriterId" name="postWriterId" value="testId">
				<input type="submit" class="btn-primary pull-right" value="글쓰기">
				
			</form>
		</div>
	</section>

	<script type="text/javascript">
		function reset() {
			$('#summernote').summernote('reset');
		}
	</script>
</body>
</html>