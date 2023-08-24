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
	<section class="review-section" style="padding: 0;">
		<div class="container">
			<div align="center">
				<div>
					<h2 class="text-white">Contact Us</h2>
				</div>
				<br>
				<div>
					<div style="background-color: white;">
						<table class="table table-bordered">
							<tr>
								<th width="100">작성자</th>
								<td align="center">${q.qnaWriter }</td>
								<th width="100">작성일자</th>
								<td align="center">${q.qnaDate }</td>
								<th width="100">답변여부</th>
								<td align="center">${q.qnaDone }</td>
							</tr>
							<tr>
								<th>제목</th>
								<td colspan="5">${r.qnaTitle }</td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="5"><textarea id="qnaSubject" name="qnaSubject"
										cols="125" rows="20" readonly="readonly">${q.qnaSubject }</textarea>
								</td>
							</tr>
						</table>
					</div>
					<br>
					<div>

						<button type="button" class="_1h8gH51Art N=a:qna.write"
							onclick="qnaUpdate('E')">수정</button>
						&nbsp;&nbsp;&nbsp;
						<button type="button" class="_1h8gH51Art N=a:qna.ask"
							onclick="qnaUpdate('D')">삭제</button>
						&nbsp;&nbsp;&nbsp;
						<button type="button" class="_1h8gH51Art N=a:qna.write"
							onclick="location.href='qnalist.do'">목록</button>
					</div>
				</div>
			</div>
		</div>
		<section class="game-author-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-8">
						<div class="anime__details__review">
							<div class="section-title">
								<h5>Reviews</h5>
							</div>

							<c:forEach items="${reviewlist }" var="r">
								<c:if test="${r.reviewLocation eq q.qnaReview }">
									<input type="hidden" id="reviewId" name="reviewId"
										value="${r.reviewId }">
									<div class="anime__review__item">
										<div class="anime__review__item__pic">
											<img src="usertemplet/img/review/1.jpg" alt="">
										</div>
										<div class="anime__review__item__text">
											<h6>
												${r.memberName } - <span>${r.reviewDate }</span>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
												<c:if test="${id eq r.memberId }">
													<a class="general_btn panel_btn" href="#"
														onclick="toggleEditForm('${r.reviewId}')"> <img
														class="toolsIcon"
														src="https://community.akamai.steamstatic.com/public/images//sharedfiles/icons/icon_edit.png">
														Edit
													</a>

													<a class="general_btn panel_btn" href="#"
														onclick="reviewDelete('${r.reviewId}')"> <img
														class="toolsIcon"
														src="https://community.akamai.steamstatic.com/public/images//sharedfiles/icons/icon_delete.png">
														Delete
													</a>

												</c:if>
											</h6>
											<div id="editForm_${r.reviewId}" style="display: none;">
												<form action="reviewedit.do" method="post">
													<input type="hidden" name="reviewId" value="${r.reviewId}">
													<textarea placeholder="Your Comment" name="reviewComment"
														class="review_edit_text_area" maxlength="400" rows="2"
														cols="30" autofocus>${r.reviewComment}</textarea>
													<button type="submit" class="button condensed save">저장</button>
													<button type="button" class="button condensed cancel"
														onclick="cancelEdit('${r.reviewId}')">취소</button>
												</form>
											</div>
											<p id="reviewText_${r.reviewId}">${r.reviewComment }</p>
										</div>

									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="anime__details__form">
					<div class="section-title">
						<h5>Your Comment</h5>
					</div>
					<form action="reviewinsert.do">
						<input type="hidden" name="reviewWriter" id="reviewWriter"
							value="${name }"> <input type="hidden"
							name="reviewLocation" id="reviewLocation" value="${q.qnaReview }">
						<input type="hidden" name="memberAuthor" id="memberAuthor"
							value="${author }">
							<input type="hidden" name="qnaId" id="qnaId" value="${q.qnaId }">
						<textarea placeholder="Your Comment" id="reviewComment"
							name="reviewComment"></textarea>
						<button type="submit" onclick="location.href='reviewinsert.do'">
							<i class="fa fa-location-arrow"></i> Review
						</button>
					</form>
				</div>
			</div>
		</section>

		<div>
			<form id="frm" method="post">
				<input type="hidden" id="qnaId" name="qnaId" value="${q.qnaId }" />
			</form>
		</div>



	</section>
	<script type="text/javascript">
		function qnaUpdate(str) {
			if (str == 'E') {
				document.getElementById("frm").action = "qnaeditform.do";
			} else {
				document.getElementById("frm").action = "qnadelete.do";
			}

			document.getElementById("frm").submit();
		}

		function toggleEditForm(reviewId) {
			var editForm = document.getElementById('editForm_' + reviewId);
			var reviewText = document.getElementById('reviewText_' + reviewId);

			if (editForm.style.display === 'none') {
				editForm.style.display = 'block';
				reviewText.style.display = 'none';
			} else {
				editForm.style.display = 'none';
				reviewText.style.display = 'block';

			}
		}

		function cancelEdit(reviewId) {
			var editForm = document.getElementById('editForm_' + reviewId);
			var reviewText = document.getElementById('reviewText_' + reviewId);

			editForm.style.display = 'none';
			reviewText.style.display = 'block';
		}

		function reviewDelete(reviewId) {
			if (confirm("정말로 이 리뷰를 삭제할까요? 되돌릴 수 없습니다.")) {
				var frm = document.createElement("form");
				frm.method = "post";
				frm.action = "reviewdelete.do";

				var input = document.createElement("input");
				input.type = "hidden";
				input.name = "reviewId";
				input.value = reviewId;

				frm.appendChild(input);
				document.body.appendChild(frm);

				frm.submit();
			}
		}
	</script>
</body>
</html>