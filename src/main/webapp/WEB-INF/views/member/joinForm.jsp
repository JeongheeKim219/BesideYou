<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="UTF-8">
<head profile="http://www.w3.org/2005/10/profile">
<link rel="icon" type="image/png" href="http://example.com/myicon.png">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="/assets/lib/jquery/dist/jquery.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var checkResultId = "";
						$("#registerForm")
								.submit(
										function() {
											if ($(
													"#registerForm :input[name=id]")
													.val().trim() == "") {
												alert("아이디를 입력하세요");
												return false;
											}
											if ($(
													"#registerForm :input[name=password]")
													.val().trim() == "") {
												alert("패스워드를 입력하세요");
												return false;
											}
											if ($(
													"#registerForm :input[name=name]")
													.val().trim() == "") {
												alert("이름을 입력하세요");
												return false;
											}
											if ($(
													"#registerForm :input[name=email]")
													.val().trim() == "") {
												alert("이메일 입력하세요");
												return false;
											}
											if ($(
													"#registerForm :input[name=postcode]")
													.val().trim() == "") {
												alert("우편번호를 입력하세요");
												return false;
											}
											if ($(
													"#registerForm :input[name=firstAddr]")
													.val().trim() == "") {
												alert("주소를 입력하세요");
												return false;
											}
											if ($(
													"#registerForm :input[name=alias]")
													.val().trim() == "") {
												alert("닉네임를 입력하세요");
												return false;
											}
											if ($(
													"#registerForm :input[name=phone]")
													.val().trim() == "") {
												alert("핸드폰 번호를 입력하세요");
												return false;
											}
											if ($(
													"#registerForm :input[name=beforeDateOfBirth]")
													.val().trim() == "") {
												alert("생년월일 입력하세요");
												return false;
											}
											if (checkResultId == "") {
												alert("아이디 중복확인을 하세요");
												return false;
											}
											var addr = "";
											addr += $("#sample6_address").val();
											addr += " ";
											addr += $("#sample6_detailAddress")
													.val();
											$("input[name=memberAddr]").val(
													addr);

										});//submit

						//아이디 체크...
						$("#registerForm :input[name=id]")
								.keyup(
										function() {
											var id = $(this).val().trim();
											//alert(id);
											if (id.length<2 || id.length>10) {
												$("#idCheckView").html(
														"2~10글자만 입력해주세요.").css(
														"background", "pink");
												checkResultId = "";
												return;
											}

											$
													.ajax({
														type : "post",
														url : "${pageContext.request.contextPath}/member/idcheckAjax",
														data : "${_csrf.parameterName}=${_csrf.token}&id="
																+ id,
														success : function(data) {
															if (data == "fail") {
																console
																		.log("중복 :"
																				+ id)
																$(
																		"#idCheckView")
																		.html(
																				"  "
																						+ id
																						+ " 중복입니다 ")
																		.css(
																				"background",
																				"red");
																checkResultId = "";
															} else {
																console.log(id)
																$(
																		"#idCheckView")
																		.html(
																				"  "
																						+ id
																						+ " 사용 할 수 있습니다 ")
																		.css(
																				"background",
																				"yellow");
																checkResultId = id;
															}
														}//callback			
													});//ajax
										});//keyup

					})
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>
<script type="text/javascript">
	function logout() {
		document.getElementById("logoutForm").submit();
	}
</script>
<!--  -->
<!--    Document Title-->
<!-- =============================================-->
<title>BU - Beside U</title>
<!--  -->
<!--    Favicons-->
<!--    =============================================-->
<link rel="apple-touch-icon" sizes="180x180"
	href="${pageContext.request.contextPath}/assets/images/BUlogo_nobg2.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/assets/images/BUlogo_nobg2.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/assets/images/BUlogo_nobg2.png">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/images/BUlogo_nobg2.png">
<link rel="manifest"
	href="${pageContext.request.contextPath}/assets/images/favicons/manifest.json">
<link rel="mask-icon"
	href="${pageContext.request.contextPath}/assets/images/favicons/safari-pinned-tab.svg"
	color="#5bbad5">
<meta name="msapplication-TileImage"
	content="${pageContext.request.contextPath}/assets/images/favicons/mstile-150x150.png">
<meta name="theme-color" content="#ffffff">
<!--  -->
<!--    Stylesheets-->
<!--    =============================================-->
<!-- Default stylesheets-->
<link href="/assets/lib/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Template specific stylesheets-->
<link href="/assets/lib/loaders.css/loaders.min.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700|Open+Sans:300,400,600,700,800"
	rel="stylesheet">
<link href="/assets/lib/iconsmind/iconsmind.css" rel="stylesheet">
<link
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet">
<link href="/assets/lib/hamburgers/dist/hamburgers.min.css"
	rel="stylesheet">
<link href="/assets/lib/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Main stylesheet and color file-->
<link href="/assets/css/style.css" rel="stylesheet">
<link href="/assets/css/custom.css" rel="stylesheet">
</head>
<body data-spy="scroll" data-target=".inner-link" data-offset="60">
	<main>
		<div class="loading" id="preloader">
			<div
				class="loader h-100 d-flex align-items-center justify-content-center">
				<div class="line-scale">
					<div></div>
					<div></div>
					<div></div>
					<div></div>
					<div></div>
				</div>
			</div>
		</div>
		<section class="text-center py">
			<div class="background-holder overlay overlay-10" 
				style="background-image: url(/assets/images/배경화면21.jpg); padding-bottom: 0px;padding-top: 0px;height: 1000;height: 1500px; " >
			</div>
			<!--/.background-holder-->
			<div class="container">
				<div class="row h-100vh align-items-center">
					<div class="col-md-12 col-lg-8 mx-auto" data-zanim-timeline="{}"
						data-zanim-trigger="scroll">
						<div data-zanim='{"delay":0}'>
							<a href="${pageContext.request.contextPath}/"><img
								src="/assets/images/BUlogo_nobg5.png" width="70" alt=""></a>
						</div>
						<div class="background-white radius-secondary p-4 p-md-5 mt-5"
							data-zanim='{"delay":0.1}'>
							<h4 class="text-uppercase fs-0 fs-md-1">Create your
								account</h4>
							<c:if test="${not empty requestScope.errorMessage}">
								<span style="color: red">${requestScope.errorMessage}</span>
							</c:if>
							<form class="mt-4 text-left" method="post"
								action="${pageContext.request.contextPath}/member/join"
								id="registerForm">

								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}">
								<div class="row align-items-center">

									<div class="col-12 mt-4">
										<input class="form-control" type="text" placeholder="ID"
											name="id" aria-label="Text input with dropdown button"><span
											id="idCheckView"></span>
									</div>
									<div class="col-12 mt-4">
										<input class="form-control" type="password"
											placeholder="Password" name="password"
											aria-label="Text input with dropdown button">
									</div>


									<div class="col-12 mt-4">
										<input class="form-control" type="text" placeholder="NAME"
											name="name" aria-label="Text input with dropdown button">
									</div>
									<div class="col-12 mt-4">
										<input class="form-control" type="text"
											placeholder="Email Address" name="email"
											aria-label="Text input with dropdown button">
									</div>
									<div class="col-12 mt-4">
										<input type="text" id="sample6_postcode" name="postcode"
											placeholder="우편번호" readonly="readonly"> <input
											class="btn btn-secondary" type="button"
											onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
									</div>

									<div class="col-12 mt-4">
										<input class="form-control" type="text" id="sample6_address"
											name="firstAddr" placeholder="주소" readonly="readonly">
										<input class="form-control" type="text"
											id="sample6_detailAddress" name="detailAddress"
											placeholder="상세주소"> <input type="hidden"
											name="memberAddr"> <input class="form-control"
											type="text" id="sample6_extraAddress" name="extraAddress"
											placeholder="참고항목" readonly="readonly">

									</div>

									<div class="col-12 mt-4">
										<input class="form-control" type="text"
											placeholder="Alias(닉네임)" name="alias"
											aria-label="Text input with dropdown button">
									</div>
									<div class="col-12 mt-4">
										<input class="form-control" type="text" placeholder="Phone"
											name="phone" aria-label="Text input with dropdown button">
									</div>
									<div class="col-12 mt-4">

										<input class="form-control" type="date" placeholder="생년월일"
											name="beforeDateOfBirth"
											aria-label="Text input with dropdown button">
									</div>
								</div>
								<div class="row align-items-center mt-3">
									<div class="col-md-6 mt-3"></div>
									<div class="col-md-6 mt-3">
										<button class="btn btn-primary btn-block" type="submit">CREATE
											</button>
										<!-- <button class="btn btn-primary btn-block" type="reset">reset</button> -->
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!--/.row-->
			</div>
			<!--/.container-->
		</section>
	</main>
	<!--  -->
	<!--    JavaScripts-->
	<!--    =============================================-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script src="/assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="/assets/lib/imagesloaded/imagesloaded.pkgd.min.js"></script>
	<script src="/assets/lib/gsap/src/minified/TweenMax.min.js"></script>
	<script
		src="/assets/lib/gsap/src/minified/plugins/ScrollToPlugin.min.js"></script>
	<script src="/assets/lib/CustomEase.min.js"></script>
	<script src="/assets/js/config.js"></script>
	<script src="/assets/js/zanimation.js"></script>
	<script src="/assets/js/inertia.js"></script>
	<script src="/assets/js/core.js"></script>
	<script src="/assets/js/main.js"></script>
</body>
</html>





































