<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function() {

		$('input:radio[name^="ques"]').on('click', function() {
			var sum = 0;

			$('input:radio[name^="ques"]:checked').each(function(index, item) {
				sum += Number($(this).val())
			})

			$("#total").val(sum);
		});

		//////////////////////////////////////////////////////
		$("#btn").on("click", function() {
			var length = $('input:radio[name^="ques"]').length;
			var len = length / 5;
			if (len != $('input:radio[name^="ques"]:checked').length) {
				alert("선택되지 않은 값이 있습니다.")
				return false;
			}
		}).prop("onclick", null);

	})
</script>
<script type="text/javascript">
	function logout() {
		document.getElementById("logoutForm").submit();
	}
</script>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
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
<style type="text/css">
#testImg {
	width: 290px;
	height: 190px;
}
</style>
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
		<section class="background-11 text-center">
			<div class="container">
				<div class="container mb-7">
					<div class="row pt-6" data-inertia='{"weight":1.5}'>
						<div class="col-md-12 px-md-0 color-white"
							data-zanim-timeline="{}" data-zanim-trigger="scroll">
							<div class="overflow-hidden">
								<h1 class="fs-4 fs-md-5 mb-5 zopacity text-center"
									data-zanim='{"delay":0}'>스트레스 검사</h1>
								<div class="overflow-hidden text-center"
									data-zanim-timeline="{}" data-zanim-trigger="scroll">
									<h5 data-zanim='{"delay":0.1}' class="color-5">나의 스트레스 지수는
										몇 점일까?</h5>

								</div>
							</div>
						</div>
					</div>
				</div>
				<div>
					<table class="table table-hover align-middle">
						<thead>
							<tr>
								<th>질문</th>
								<th>전혀 없었다.</th>
								<th>거의 없었다.</th>
								<th>때때로 있었다.</th>
								<th>자주 있었다.</th>
								<th>매우 자주 있었다.</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>예상치 못한 일 때문에 당황한 적이 얼마나 있습니까?</td>
								<td><input class="form-check-input" type="radio" value="0"
									name="ques1"></td>
								<td><input class="form-check-input" type="radio" value="1"
									name="ques1"></td>
								<td><input class="form-check-input" type="radio" value="2"
									name="ques1"></td>
								<td><input class="form-check-input" type="radio" value="3"
									name="ques1"></td>
								<td><input class="form-check-input" type="radio" value="4"
									name="ques1"></td>
							</tr>
							<tr>
								<td>인생에서 중요한 일들을 조절할 수 없다는 느낌을 얼마나 경험하였습니까?</td>
								<td><input class="form-check-input" type="radio" value="0"
									name="ques2"></td>
								<td><input class="form-check-input" type="radio" value="1"
									name="ques2"></td>
								<td><input class="form-check-input" type="radio" value="2"
									name="ques2"></td>
								<td><input class="form-check-input" type="radio" value="3"
									name="ques2"></td>
								<td><input class="form-check-input" type="radio" value="4"
									name="ques2"></td>
							</tr>
							<tr>
								<td>신경이 예민해지고 스트레스를 받고 있다는 느낌을 얼마나 경험하였습니까?</td>
								<td><input class="form-check-input" type="radio" value="0"
									name="ques3"></td>
								<td><input class="form-check-input" type="radio" value="1"
									name="ques3"></td>
								<td><input class="form-check-input" type="radio" value="2"
									name="ques3"></td>
								<td><input class="form-check-input" type="radio" value="3"
									name="ques3"></td>
								<td><input class="form-check-input" type="radio" value="4"
									name="ques3"></td>
							</tr>
							<tr>
								<td>당신의 개인적 문제들을 다루는 데 있어서 얼마나 자주 자신감을 느꼈습니까?</td>
								<td><input class="form-check-input" type="radio" value="0"
									name="ques4"></td>
								<td><input class="form-check-input" type="radio" value="1"
									name="ques4"></td>
								<td><input class="form-check-input" type="radio" value="2"
									name="ques4"></td>
								<td><input class="form-check-input" type="radio" value="3"
									name="ques4"></td>
								<td><input class="form-check-input" type="radio" value="4"
									name="ques4"></td>
							</tr>
							<tr>
								<td>일상의 일들이 당신의 생각대로 진행되고 있다는 느낌을 얼마나 경험하였습니까?</td>
								<td><input class="form-check-input" type="radio" value="0"
									name="ques5"></td>
								<td><input class="form-check-input" type="radio" value="1"
									name="ques5"></td>
								<td><input class="form-check-input" type="radio" value="2"
									name="ques5"></td>
								<td><input class="form-check-input" type="radio" value="3"
									name="ques5"></td>
								<td><input class="form-check-input" type="radio" value="4"
									name="ques5"></td>
							</tr>
							<tr>
								<td>당신이 꼭 해야 하는 일을 처리할 수 없다고 생각한 적이 얼마나 있었습니까?</td>
								<td><input class="form-check-input" type="radio" value="0"
									name="ques6"></td>
								<td><input class="form-check-input" type="radio" value="1"
									name="ques6"></td>
								<td><input class="form-check-input" type="radio" value="2"
									name="ques6"></td>
								<td><input class="form-check-input" type="radio" value="3"
									name="ques6"></td>
								<td><input class="form-check-input" type="radio" value="4"
									name="ques6"></td>
							</tr>
							<tr>
								<td>일상생활의 짜증을 얼마나 자주 잘 다스릴 수 있었습니까?</td>
								<td><input class="form-check-input" type="radio" value="0"
									name="ques7"></td>
								<td><input class="form-check-input" type="radio" value="1"
									name="ques7"></td>
								<td><input class="form-check-input" type="radio" value="2"
									name="ques7"></td>
								<td><input class="form-check-input" type="radio" value="3"
									name="ques7"></td>
								<td><input class="form-check-input" type="radio" value="4"
									name="ques7"></td>
							</tr>
							<tr>
								<td>최상의 컨디션이라고 얼마나 자주 느끼셨습니까?</td>
								<td><input class="form-check-input" type="radio" value="0"
									name="ques8"></td>
								<td><input class="form-check-input" type="radio" value="1"
									name="ques8"></td>
								<td><input class="form-check-input" type="radio" value="2"
									name="ques8"></td>
								<td><input class="form-check-input" type="radio" value="3"
									name="ques8"></td>
								<td><input class="form-check-input" type="radio" value="4"
									name="ques8"></td>
							</tr>
							<tr>
								<td>당신이 통제할 수 없는 일때문에 화가 난 경험이 얼마나 있었습니까?</td>
								<td><input class="form-check-input" type="radio" value="0"
									name="ques9"></td>
								<td><input class="form-check-input" type="radio" value="1"
									name="ques9"></td>
								<td><input class="form-check-input" type="radio" value="2"
									name="ques9"></td>
								<td><input class="form-check-input" type="radio" value="3"
									name="ques9"></td>
								<td><input class="form-check-input" type="radio" value="4"
									name="ques9"></td>
							</tr>
							<tr>
								<td>어려운 일이 너무 많이 쌓여서 극복하지 못할 것 같은 느낌을 얼마나 자주 경험하셨습니까?</td>
								<td><input class="form-check-input" type="radio" value="0"
									name="ques10"></td>
								<td><input class="form-check-input" type="radio" value="1"
									name="ques10"></td>
								<td><input class="form-check-input" type="radio" value="2"
									name="ques10"></td>
								<td><input class="form-check-input" type="radio" value="3"
									name="ques10"></td>
								<td><input class="form-check-input" type="radio" value="4"
									name="ques10"></td>
							</tr>


						</tbody>
					</table>
					<form name="inForm" method="post" id="inForm"
						action="${pageContext.request.contextPath}/psy/lo/stressInsert">
						<input type="hidden" name="testName" value="1"> <input
							type="hidden" name="total" id="total" value=""> <input
							type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}"> <input type="submit" id="btn"
							class="btn btn-outline-primary" value="결과보기">
					</form>

				</div>
			</div>
			<!--/.container-->
		</section>
		<section class=" background-primary py-6">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-md">
						<h3 class="color-white mb-0">슬프고 우울한 날에도 당신의 곁에 Beside-U</h3>
					</div>
				</div>
				<!--/.row-->
				<br>
				<div>
					<h6 style="color: #949494">상호명:(주)BU | 대표:박기현</h6>
					<h6 style="color: #949494">사업장소재지:(13637) 경기도 성남시 분당구 성남대로 34
						6층(구미동 하나프라자빌딩)</h6>
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
	<script src="/assets/lib/jquery/dist/jquery.min.js"></script>
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