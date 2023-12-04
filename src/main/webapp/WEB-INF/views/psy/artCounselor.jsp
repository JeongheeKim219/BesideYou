<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function() {
		var nowPage = $
		{
			nowPage
		}
		;
		//alert(nowPage)
		$("#page" + nowPage).parent().addClass("active");

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
				<div class="row text-center mb-5">
					<div class="col">
						<h3 class="fs-2 fs-md-3 fw-600">상담사 선택</h3>
						<hr class="short"
							data-zanim='{"from":{"opacity":0,"width":0},"to":{"opacity":1,"width":"4.20873rem"},"duration":0.8}'
							data-zanim-trigger="scroll">
						<div
							class="col-sm-8 col-lg-12 px-4 px-sm-3 mt-4 mt-sm-0 text-lg-x text-center"
							data-zanim-timeline="{}" data-zanim-trigger="scroll">
							<h5 data-zanim='{"delay":0}' class="color-6">내 그림에 답변할 상담사를
								선택해주세요.</h5>
						</div>
					</div>
				</div>
				<div class="row">
					<c:choose>
						<c:when test="${not empty list}">
							<c:forEach items="${list.content}" var="list">
								<div class="col-md-6 col-lg-4 py-0 mt-4 mt-lg-0">
									<div class="background-white pb-4 h-100 radius-secondary">
										<img class="w-100 radius-tr-secondary radius-tl-secondary"
											src="/assets/counselor/${list.counselor.picture}" alt="Profile Image"/>
										<div class="px-4 pt-4" data-zanim-timeline="{}"
											data-zanim-trigger="scroll">
											<div class="overflow-hidden">
												<a href="news.html">
													<h5 data-zanim='{"delay":0}'>${list.counselor.member.name}</h5>
												</a>
											</div>
											<div class="overflow-hidden">
												<p class="color-7" data-zanim='{"delay":0.1}'>${list.counselor.degree}</p>
											</div>
											<div class="overflow-hidden">
												<p class="mt-3" data-zanim='{"delay":0.2}'>${list.counselor.career}</p>
											</div>
											<div class="overflow-hidden">
												<div class="d-inline-block" data-zanim='{"delay":0.3}'>
													<a class="d-flex align-items-center"
														href="${pageContext.request.contextPath}/psy/lo/artTest/${list.artCounselorCode}">선택하기
														<div class="overflow-hidden ml-2"
															data-zanim='{"from":{"opacity":0,"x":-30},"to":{"opacity":1,"x":0},"delay":0.8}'>
															<span class="d-inline-block">&xrarr;</span>
														</div>
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>

						</c:when>
						<c:otherwise>
							<div class="col">
								<h3 class="text-center fs-2 fs-md-3">등록된 그림상담사가 없습니다.</h3>
							</div>
						</c:otherwise>
					</c:choose>

				</div>
				<!--/.row-->
				<!-- ***************************************페이징처리******************************************* -->

				<div class="col-auto mx-auto mt-4">
					<nav class="font-1 mt-5" aria-label="Page navigation example">
						<ul class="pagination pagination justify-content-center">
							<c:set var="doneLoop" value="false" />

							<c:if test="${(startPage-blockCount) >0 }">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/psy/lo/artCounselor?nowPage=${startPage-1}"
									aria-label="Previous"><span aria-hidden="true">«</span><span
										class="sr-only">Previous</span></a></li>
							</c:if>

							<c:forEach var="i" begin="${startPage}"
								end="${(startPage-1)+blockCount}">
								<c:if test="${(i-1)>=list.getTotalPages()}">
									<c:set var="doneLoop" value="true" />
								</c:if>


								<c:if test="${not doneLoop}">
									<li class="page-item"><a class="page-link" id="page${i}"
										href="${pageContext.request.contextPath}/psy/lo/artCounselor?nowPage=${i}">${i}</a>
									</li>
								</c:if>


							</c:forEach>

							<c:if test="${(startPage+blockCount)<=list.getTotalPages()}">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/psy/lo/artCounselor?nowPage=${startPage+blockCount}"
									aria-label="Next"><span aria-hidden="true">»</span><span
										class="sr-only">Next</span></a></li>
							</c:if>

						</ul>
					</nav>
				</div>
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