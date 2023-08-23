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
		data-setbg="usertemplet/img/page-top-bg/3.jpg">
		<div class="page-info">
			<h2>Promotion</h2>
			<div class="site-breadcrumb">
				<a href="home.do">Home</a> / <span>Promotion</span>
			</div>
		</div>
	</section>
	<!-- Page top end-->

	<!--  Sale start -->
	<div class="section trending">
		<div class="container" id="genpa">
			<ul class="trending-filter" id="key">
				<li><a class="is_active"
					href="" data-filter=".adv">Show
						All</a></li>
				<li><a class="is_active" href="javascript:genreList('어드벤처')"
					data-filter=".adv">adventure</a></li>
				<li><a class="is_active" href="javascript:genreList('전략')"
					data-filter=".str">strategy</a></li>
				<li><a class="is_active" href="javascript:genreList('스포츠')"
					data-filter=".rac">sports</a></li>
				<li><a class="is_active" href="javascript:genreList('롤플레잉')"
					data-filter=".rac">role-playing</a></li>
				<li><a class="is_active" href="javascript:genreList('액션')"
					data-filter=".rac">Action</a></li>
			</ul>
			<div class="row trending-box" id="gen">
				<c:forEach items="${games }" var="g">
					<c:if test="${not empty games && g.gamePriceDiscount ne 0}">
						<div
							class="col-lg-3 col-md-6 align-self-center mb-30 trending-items col-md-6 adv">
							<div class="item">
								<div class="thumb">
									<a href="javascript:selectGame(${g.gameId })"><img
										src="${g.gameIllustMini }" alt=""></a> <span class="price"><em>${g.gamePrice }원</em>${g.gamePriceDiscount }원</span>
								</div>
								<div class="down-content">
									<span class="category">${g.gameGenre }</span>
									<h4>${g.gameName }</h4>
									<a href="javascript:selectGame(${g.gameId })"><i
										class="fa fa-shopping-bag"></i></a>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<div class="site-pagination">
				<a href="#" class="active">01.</a> <a href="#">02.</a> <a href="#">03.</a>
			</div>
		</div>
	</div>
	<div>
		<form id="gamefrm" action="gameinfo.do" method="post">
			<input type="hidden" id="gameId" name="gameId">
		</form>
	</div>
	<!--  Sale End -->
	<script type="text/javascript">
		function selectGame(n) {
			document.getElementById("gameId").value = n;
			document.getElementById("gamefrm").submit();
		}
		
		function genreList(selectedGenre) {//genre
	        let key = selectedGenre;
	        let payload = "key=" + key;
	        let url = "ajaxgenre.do";

	        fetch(url, {
	            method: "POST",
	            headers: {
	                "Content-Type": "application/x-www-form-urlencoded",
	            },
	            body: payload,
	        })
	        .then(response => response.json())
	        .then(json => {
	            if (selectedGenre === "Show All") {
	                // "Show All"을 선택한 경우, 할인 중인 모든 게임 표시
	                const discountedGames = json.filter(data => data.gamePriceDiscount !== 0);
	                updateGenreSection(discountedGames, selectedGenre);
	            } else {
	                // 특정 장르를 선택한 경우, 해당 장르의 게임 표시
	                updateGenreSection(json, selectedGenre);
	            }
	        });
	    }
		
		function updateGenreSection(datas, selectedGenre) {
		    const genreSection = document.querySelector('#gen');
		    const existingItems = genreSection.querySelectorAll('.trending-items');
		    existingItems.forEach(item => item.remove());

		    datas.forEach(data => {
		        if (data.gameGenre === selectedGenre && data.gamePriceDiscount !== 0) { // 선택한 장르로 게임 필터링
		            const newGameItem = createGameItem(data);
		            genreSection.appendChild(newGameItem);
		        }
		    });
		}
		function createGameItem(data) {
		    const gameItem = document.createElement('div');
		    gameItem.className = 'col-lg-3 col-md-6 align-self-center mb-30 trending-items col-md-6 adv';
		    gameItem.innerHTML = `
		        <div class="item">
		            <div class="thumb">
		                <a href="javascript:selectGame(${g.gameId })"><img
		                    src="\${data.gameIllustMini}" alt=""></a> <span class="price"><em>\${data.gamePrice}원</em>\${data.gamePriceDiscount}원</span>
		            </div>
		            <div class="down-content">
		                <span class="category">\${data.gameGenre}</span>
		                <h4>\${data.gameName}</h4>
		                <a href="javascript:selectGame(\${data.gameId})"><i
		                    class="fa fa-shopping-bag"></i></a>
		            </div>
		        </div>
		    `;

		    // 게임 선택 버튼에 이벤트 리스너 추가
		    gameItem.querySelector('.fa-shopping-bag').addEventListener('click', () => selectGame(data.gameId));

		    return gameItem;
		}






		
	</script>
</body>

</html>