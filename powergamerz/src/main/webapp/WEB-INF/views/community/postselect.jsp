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
	
	<!-- Table section -->
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
							<c:if test="${not empty p.postAttach }">
							<tr>
								<th width="100">이미지</th>
								<td colspan="5"><img src="attach/post/${p.postAttach }" style="width:500px; height:300px;"></td>
							</tr>
							</c:if>
							<tr>
								<th width="100">내용</th>
								<td colspan="5">
								${p.postSubject }
								</td>
							</tr>
							<tr>
								<th width="100">첨부파일</th>
								<td colspan="5">${p.postAttach}</td>
							</tr>
						</table>
					</div>
					<br>
					<div>
					 	<c:if test="${id eq p.postWriterId || author eq 'ADMIN' }"> 
							<button type="button" class="btn btn-primary btn-jelly btn-lg" onclick="postUpdate('E')">수정 </button>
							<button type="button" class="btn btn-danger btn-jelly btn-lg" onclick="postUpdate('D')">삭제</button>			
						</c:if> 
						<button type="button" class="btn btn-light btn-jelly btn-lg" onclick="location.href='postlist.do'">목록</button>
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
	<!-- End Table section -->
	
	<!-- review section -->
	<section class="game-author-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="anime__details__review">
						<div class="section-title">
							<h5>Reviews</h5>
						</div>

						<c:forEach items="${reviewlist }" var="r">
							<c:if test="${r.reviewLocation eq p.postReview }">
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
				<c:if test="${not empty id }">
					<form action="reviewinsert.do">
						<input type="hidden" name="reviewWriter" id="reviewWriter"
							value="${name }"> <input type="hidden"
							name="reviewLocation" id="reviewLocation" value="${p.postReview }">
						<textarea placeholder="Your Comment" id="reviewComment"
							name="reviewComment"></textarea>
						<button type="submit" onclick="location.href='reviewinsert.do'">
							<i class="fa fa-location-arrow"></i> Review
						</button>
						<input type="hidden" name="reviewPage" value="${p.postPage }">
						<input type="hidden" name="reviewPageId" value="${p.postId }">
					</form>
				</c:if>
				<c:if test="${empty id }">
					<form action="logincontroller.do" method="post">
						<input type="hidden" name="reviewWriter" id="reviewWriter"
							value="${name }"> <input type="hidden"
							name="reviewLocation" id="reviewLocation" value="${p.postReview }">
						<textarea placeholder="Your Comment" id="reviewComment"
							name="reviewComment" readonly>로그인 후 이용하세요</textarea>
						<button type="submit" onclick="location.href='reviewinsert.do'">
							<i class="fa fa-location-arrow"></i> Login
						</button>
					</form>
				</c:if>
			</div>
		</div>
	</section>
	<!-- End review section -->
	
	<script type="text/javascript">
		function postUpdate(str) {
			if (str == 'E') {
				document.getElementById("frm").action = "posteditform.do";
			} else {
				document.getElementById("frm").action = "postdelete.do";
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