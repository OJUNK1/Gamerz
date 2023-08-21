<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="google-signin-client_id" content="779704502037-d6iar8c2cu644l1ll1rra6rv0geljq3s.apps.googleusercontent.com">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

</head>
<body>
	<!-- Page top section -->
	<section class="page-top-section set-bg"
		data-setbg="usertemplet/img/review-bg.png">
		<div class="page-info">
			<h2>Games</h2>
			<div class="site-breadcrumb">
				<a href="home.do">Home</a> / <span>Login</span>
			</div>
		</div>
	</section>
	<!-- Page top end-->
	
	<!-- Normal Breadcrumb Begin -->
	<section class="normal-breadcrumb set-bg"
		data-setbg="usertemplet/img/review-bg-2.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="normal__breadcrumb__text">
						<h2>Login</h2>
						<p>Welcome to Gamerz.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Normal Breadcrumb End -->


	<!-- Login Section Begin -->

	<section class="login spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login__form">
						<h3>Login</h3>
						<form action="login.do" method="post">
							<div class="input__item">
								<input type="text" id="memberId" name="memberId" placeholder="Your Id"> <span
									class="icon_mail"></span>
							</div>
							<div class="input__item">
								<input type="password" id="memberPassword" name="memberPassword" placeholder="Password"> <span
									class="icon_lock"></span>
							</div>
							<button type="submit" class="site-btn2" onclick="valueCheck()">Login Now</button>
						</form>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login__register">
						<h3>Don’t Have An Account?</h3>
						<a href="signupcontroller.do" class="primary-btn">Register Now</a>
					</div>
				</div>
			</div>
			<div class="login__social">
				<div class="row d-flex justify-content-center">
					<div class="col-lg-6">
						<div class="login__social__links">
							<span>or</span>
							<ul>
								<li id="naverlogin"><a href="#" class="facebook"><i
										class="fa fa-facebook"></i> Sign in With Naver</a></li>
								<li id="googlelogin"><a href="javascript:void(0)" class="google"><i class="fa fa-google"></i>
									Sign in With Google</a></li>
								<li id="kakaologin"><a href="#" class="twitter"><i
										class="fa fa-twitter"></i> Sign in With Kakao</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Login Section End -->
	
	<!-- JS Section Begin -->
	
	<script>
		function valueCheck(){
			let id = document.getElementById("memberId").value;
			// get방식 ajax호출
				let url = "ajaxIdCheck.do?memberId=" + id;	
				fetch(url)
					.then(response => response.text())
					.then(text => checkId(text));
		}
		
		function chechId(){
			
		}
	</script>
	
	<!-- Google Login Api Begin -->
	<script type="text/javascript">
	function init() {
	gapi.load('auth2', function() {
		gapi.auth2.init();
		options = new gapi.auth2.SigninOptionsBuilder();
		options.setPrompt('select_account');
		options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
		gapi.auth2.getAuthInstance().attachClickHandler('googlelogin', options, onSignIn, onSignInFailure);
		})
	}
	
	function onSignIn(googleUser) {
		var access_token = googleUser.getAuthResponse().access_token
		$.ajax({
			url: 'https://people.googleapis.com/v1/people/me'
			, data: {personFields:'birthdays', key:'AIzaSyBYUOBiRNq5SziHGXP_DSKLYTSnChe8-1U', 'access_token': access_token}
			, method:'GET'
		})
		.done(function(e){
			var profile = googleUser.getBasicProfile();
			console.log(profile)
		})
		.fail(function(e){
			console.log(e);
		})
	}
	
	function onSignInFailure(t){		
		console.log(t);
	}
	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
	</script>
	<!-- Google Login Api End -->
	
	<!-- 
	<script>
	
	</script>
	-->
	
	<!-- JS Section End -->
</body>
</html>