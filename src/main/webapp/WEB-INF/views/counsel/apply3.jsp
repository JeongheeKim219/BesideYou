<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<link
	href="${pageContext.request.contextPath}/assets/lib/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Template specific stylesheets-->
<link
	href="${pageContext.request.contextPath}/assets/lib/loaders.css/loaders.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700|Open+Sans:300,400,600,700,800"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/iconsmind/iconsmind.css"
	rel="stylesheet">
<link
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/hamburgers/dist/hamburgers.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/remodal/dist/remodal.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/remodal/dist/remodal-default-theme.css"
	rel="stylesheet">
<!-- Main stylesheet and color file-->
<link href="${pageContext.request.contextPath}/assets/css/style.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/custom.css"
	rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#sub").click(function() {
			if ($("#requestCategory").val() == 'none') {
				alert("고민 유형을 선택해주세요.");
				return;
			}
			if ($("#requestTitle").val() == '') {
				alert("제목을 입력해주세요.");
				return;
			}
			if ($("#content").val() == '') {
				alert("내용을 입력해주세요.");
				return;
			}
			
			if (confirm("등록하시겠습니까?")) {
				if($("input[name = 'remainTicket'").val() <= 0){
					alert("보유중인 상담권이 없어 결제창으로 이동합니다.");
					$("#submitForm").attr("action", "${pageContext.request.contextPath}/ticket/ticketApp")
				}
				$("#submitForm").submit();
			}
		})

		$('#content').on('keyup', function() {
			$('#textCnt').html("( " + $(this).val().length + " / 1000 )");

			if ($(this).val().length > 1000) {
				alert("1000자까지 입력 가능합니다!");
				$(this).val($(this).val().substring(0, 1000));
				$('#textCnt').html("( 1000 / 1000 )");
			}
		});
	})
</script>

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
		<div class="znav-white znav-container sticky-top navbar-elixir"
			id="znav-container">
			<div class="container">
				<nav class="navbar navbar-expand-lg">
					<a class="navbar-brand overflow-hidden pr-3" href="${pageContext.request.contextPath}/"><img
						src="${pageContext.request.contextPath}/assets/images/BUlogo_nobg2.png"
						alt="" style="width: 50px; height: 50px" /></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
						aria-expanded="false" aria-label="Toggle navigation">
						<div class="hamburger hamburger--emphatic">
							<div class="hamburger-box">
								<div class="hamburger-inner"></div>
							</div>
						</div>
					</button>
					<div class="collapse navbar-collapse" id="navbarNavDropdown">
						<ul class="navbar-nav fs-0 fw-700">
							<li><a href="${pageContext.request.contextPath}/counsel/counselorList">상담사검색</a>
								</li>
							<li><a href="#">테스트/검사</a>
								<ul class="dropdown fs--1">
									<li><a href="${pageContext.request.contextPath}/psy/list">자가진단 테스트</a></li>
									<li><a href="${pageContext.request.contextPath}/psy/art">그림 심리검사</a></li>
								</ul></li>
							<li><a href="#">마이페이지</a>
								<ul class="dropdown fs--1">
									<li><a href="${pageContext.request.contextPath}/member/read">내 정보</a></li>
									<sec:authorize access="!hasRole('ROLE_COUNSELOR')">
										<li><a href="${pageContext.request.contextPath}/counsel/myCounselList?field=-1">내 상담예약</a></li>
										<li><a href="${pageContext.request.contextPath}/counsel/myCounselList?field=3">내 상담글</a></li>
										<li><a href="${pageContext.request.contextPath}/ticket/mylist">상담권 구매내역</a></li>
										<li><a href="${pageContext.request.contextPath}/psy/lo/result">테스트 결과</a></li>
										<li><a href="${pageContext.request.contextPath}/psy/lo/answerList">그림 심리검사 결과</a></li>
									</sec:authorize>
								</ul></li>
							<li><a href="#">고객센터</a>
								<ul class="dropdown fs--1">
									<li><a href="${pageContext.request.contextPath}/contact/list">1:1문의</a></li>
									<li><a href="${pageContext.request.contextPath}/faq/list">FAQ</a></li>
									<li><a href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
								</ul></li>
							<li><a href="#">상담사메뉴</a>
								<ul class="dropdown fs--1">
									<sec:authorize access="!hasRole('ROLE_COUNSELOR')">
										<li><a href="${pageContext.request.contextPath}/counselor/CounselorJoin">상담사 신청</a></li>
									</sec:authorize>
									<sec:authorize access="hasRole('ROLE_COUNSELOR')">
										<li><a href="${pageContext.request.contextPath}/counselor/read">상담사 등록 정보</a></li>
										<li><a href="${pageContext.request.contextPath}/psy/lo/signupArt">그림상담사 신청</a></li>
										<li><a href="${pageContext.request.contextPath}/psy/lo/cancle">그림상담사 해지</a></li>
										<li><a href="${pageContext.request.contextPath}/psy/lo/requestList">그림검사 요청목록</a></li>
										<li><a href="${pageContext.request.contextPath}/counsel/listForCounselor?field=-1">상담예약 요청목록</a></li>
										<li><a href="${pageContext.request.contextPath}/counsel/listForCounselor?field=3">상담글 요청목록</a></li>
									</sec:authorize>
								</ul></li>
						</ul>
						<ul class="navbar-nav ml-lg-auto">
							<sec:authorize access="isAnonymous()">
								<!-- 또는 !isAuthenticated() 로 비교해도 된다.  로그인을 하지 않은 사용자-->
								<li><a
									href="${pageContext.request.contextPath}/member/login">Login</a></li>
								<li><a
									href="${pageContext.request.contextPath}/member/joinForm">Join</a></li>
							</sec:authorize>
							
							<sec:authorize access="isAuthenticated()">
								<li style="vertical-align: middle;">
									<h6 style="margin-bottom: 0 !important; color: #2A3855">
										<sec:authentication property="principal.name"/>님 
										<sec:authorize access="hasRole('ROLE_COUNSELOR')">
											(상담사)
										</sec:authorize>
										</h6>
										<!-- Authentication의 getPrincipal().getName() -> Principal은 Provider에서 Authentication 에 넣어준 VO(생성자 첫 매개변수) -->
								</li>
								<li style="vertical-align: middle;"><a href="javascript:logout();" style="color: #2A3855;padding-top: 0 !important;padding-bottom: 0 !important">logout</a></li>
								
								
								<form id="logoutForm" action="${pageContext.request.contextPath}/member/logout" method="post" style="display: none">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								</form>
							</sec:authorize>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<section class="background-11">
			<div class="container">
				<div class="row no-gutters">
					<div class="col-lg-4 py-3 py-lg-0"
						style="min-height: 400px; background-position: top">
						<div
							class="background-holder radius-tl-secondary radius-bl-lg-secondary radius-tr-secondary radius-tr-lg-0"
							style="background-image:url(${pageContext.request.contextPath}/assets/images/ceo.jpg);">
						</div>
						<!--/.background-holder-->
					</div>
					<div
						class="col-lg-8 px-5 py-6 my-lg-0 background-white radius-tr-lg-secondary radius-br-secondary radius-bl-secondary radius-bl-lg-0"
						style="vertical-align: top; padding-top: 20px !important">
						<div data-zanim-timeline="{}" data-zanim-trigger="scroll"
							style="width: 100%; height: 100%; word-break: break-all">
							<h3 class="text-center fs-2 fs-md-3">상담사 정보</h3>
							<hr class="short"
								data-zanim='{"from":{"opacity":0,"width":0},"to":{"opacity":1,"width":"4.20873rem"},"duration":0.8}'
								data-zanim-trigger="scroll" />
							<br>


							<table style="width: 100%">
								<tr>
									<td style="width: 180px">
										<h5 data-zanim='{"delay":0}'>선택한 상담사</h5>
									</td>
									<td>
										<h5 data-zanim='{"delay":0}'>${counselor.member.name}</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5 data-zanim='{"delay":0}'>선택한 상담유형</h5>
									</td>
									<td>
										<h5 data-zanim='{"delay":0}'>간편 텍스트 상담</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5 data-zanim='{"delay":0}'>상담사 학위</h5>
									</td>
									<td>
										<h5 data-zanim='{"delay":0}'>${counselor.degree}</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5 data-zanim='{"delay":0}'>상담센터 주소</h5>
									</td>
									<td>
										<h5 data-zanim='{"delay":0}'>${counselor.counselorAddr}</h5>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="height: 20px"></td>
								</tr>
								<tr>
									<td colspan="2">
										<h5 data-zanim='{"delay":0}'>상담사 경력</h5>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<h5 data-zanim='{"delay":0}'>${counselor.career}</h5>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="height: 20px"></td>
								</tr>
								<tr>
									<td>
										<h5 data-zanim='{"delay":0}'>보유중인 상담권</h5>
									</td>
									<td>
										<h5 data-zanim='{"delay":0}' style="color: red">${remainTicket}
											매</h5>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<h6 data-zanim='{"delay":0}' style="color: red">※상담 답변 이후에는 취소가 불가능합니다.</h6>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="row mt-6" style="margin-top: 10px !important">
					<div class="col"></div>
					<div class="col-12">
						<div
							class="background-white px-3 mt-6 px-0 py-5 px-lg-5 radius-secondary"
							style="margin-top: 20px !important">
							<h3 class="text-center fs-2 fs-md-3">상담내용 입력</h3>
							<hr class="short"
								data-zanim='{"from":{"opacity":0,"width":0},"to":{"opacity":1,"width":"4.20873rem"},"duration":0.8}'
								data-zanim-trigger="scroll" />
							<form action="${pageContext.request.contextPath}/counsel/submit3"
								method="post" id="submitForm">
								<input type="hidden" name="counselorCode"
									value="${counselor.counselorCode}" /> <input type="hidden"
									name="counselCategory" value="${counselField}" /> 
								<input
									type="hidden" name="remainTicket" value="${remainTicket}" />
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
								<table style="width: 100%; vertical-align: middle;">
									<tr style="height: 100px;">
										<td style="width: 130px">
											<h5>고민 유형</h5>
										</td>
										<td style="width: 250px">
											<select name="requestCategory" id = "requestCategory" style="width: 200px">
												<option value="none">----선택----</option>
												<option value="우울">우울</option>
												<option value="불안">불안</option>
												<option value="분노">분노</option>
												<option value="강박">강박</option>
												<option value="무기력">무기력</option>
												<option value="자살">자살</option>
												<option value="자존감상실">자존감상실</option>
												<option value="자해">자해</option>
												<option value="스트레스">스트레스</option>
												<option value="트라우마">트라우마</option>
												<option value="공황">공황</option>
												<option value="콤플렉스">콤플렉스</option>
												<option value="상실">상실</option>
												<option value="대인관계">대인관계</option>
												<option value="친구">친구</option>
												<option value="부부">부부</option>
												<option value="연인">연인</option>
												<option value="가족">가족</option>
												<option value="직장">직장</option>
												<option value="진로">진로</option>
												<option value="취업">취업</option>
												<option value="육아">육아</option>
												<option value="해외생활">해외생활</option>
												<option value="중독">중독</option>
												<option value="섭식장애">섭식장애</option>
												<option value="성생활">성생활</option>
												<option value="성소수자">성소수자</option>
												<option value="감정조절">감정조절</option>
												<option value="기타">기타</option>
											</select>
										</td>
										<td>
											<h5>상담글 제목</h5>
										</td>
										<td style="width: 520px; text-align: right;">
											<input
												type="text" name="requestTitle" id="requestTitle" style="width: 500px">
										</td>
									</tr>
									<tr>
										<td colspan="4">
											<h5>상담내용</h5>
										</td>
									</tr>
									<tr>
										<td colspan="4" style="text-align: right;"><textarea
												name="requestContent" id="content"
												style="width: 100%; height: 500px"
												placeholder="고민에 대해 작성해주세요."></textarea>
											<div id="textCnt">( 0 / 1000 )</div></td>
									</tr>
									<tr style="height: 100px">
										<td colspan="4" style="text-align: right;"><input
											id="sub" type="button" class="btn btn-success" value="상담글 등록" />
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
				<!--/.row-->
			</div>
			<!--/.container-->
		</section>
		<section class=" background-primary py-6">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-md">
						<h3 class="color-white mb-0">
							슬프고 우울한 날에도 당신의 곁에 Beside-U
						</h3>
					</div>
				</div>
				<!--/.row-->
				<br>
				<div>
					<h6 style="color: #949494">상호명:(주)BU | 대표:박기현</h6>
					<h6 style="color: #949494">사업장소재지:(13637) 경기도 성남시 분당구 성남대로 34 6층(구미동 하나프라자빌딩)</h6>
					<h6 style="color: #949494">사업자등록번호:199-4082-3</h6>
					<h6 style="color: #949494">대표메일:mooyaho@kosta.com</h6>
					<h6 style="color: #949494">© BU All rights reserved.</h6>
				</div>
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
		src="${pageContext.request.contextPath}/assets/lib/jquery/dist/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/lib/imagesloaded/imagesloaded.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/lib/gsap/src/minified/TweenMax.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/lib/gsap/src/minified/plugins/ScrollToPlugin.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/lib/CustomEase.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/config.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/zanimation.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/inertia.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/lib/remodal/dist/remodal.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/core.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>