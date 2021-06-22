<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

	})
</script>

<style>
table {
	width: 100%;
	border-top: 1px solid #ffffff;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #ffffff;
	padding: 10px;
	text-align: center;
	height: 50px;
}

thead tr {
	background-color: #3680B3;
	color: #ffffff;
}

tbody tr:nth-child(2n) {
	background-color: #F2F2F2;
}

tbody tr:nth-child(2n+1) {
	background-color: #E1E1E1;
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
					<a class="navbar-brand overflow-hidden pr-3"
						href="${pageContext.request.contextPath}/"><img
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
							<li><a
								href="${pageContext.request.contextPath}/counsel/counselorList">상담사검색</a>
							</li>
							<li><a href="#">테스트/검사</a>
								<ul class="dropdown fs--1">
									<li><a href="${pageContext.request.contextPath}/psy/list">자가진단
											테스트</a></li>
									<li><a href="${pageContext.request.contextPath}/psy/art">그림
											심리검사</a></li>
								</ul></li>
							<li><a href="#">마이페이지</a>
								<ul class="dropdown fs--1">
									<li><a
										href="${pageContext.request.contextPath}/member/read">내 정보</a></li>
									<sec:authorize access="!hasRole('ROLE_COUNSELOR')">
										<li><a
											href="${pageContext.request.contextPath}/counsel/myCounselList?field=-1">내
												상담예약</a></li>
										<li><a
											href="${pageContext.request.contextPath}/counsel/myCounselList?field=3">내
												상담글</a></li>
										<li><a
											href="${pageContext.request.contextPath}/ticket/mylist">상담권
												구매내역</a></li>
										<li><a
											href="${pageContext.request.contextPath}/psy/lo/result">테스트
												결과</a></li>
										<li><a
											href="${pageContext.request.contextPath}/psy/lo/answerList">그림
												심리검사 결과</a></li>
									</sec:authorize>
								</ul></li>
							<li><a href="#">고객센터</a>
								<ul class="dropdown fs--1">
									<li><a
										href="${pageContext.request.contextPath}/contact/list">1:1문의</a></li>
									<li><a href="${pageContext.request.contextPath}/faq/list">FAQ</a></li>
									<li><a
										href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
								</ul></li>
							<li><a href="#">상담사메뉴</a>
								<ul class="dropdown fs--1">
									<sec:authorize access="!hasRole('ROLE_COUNSELOR')">
										<li><a
											href="${pageContext.request.contextPath}/counselor/CounselorJoin">상담사
												신청</a></li>
									</sec:authorize>
									<sec:authorize access="hasRole('ROLE_COUNSELOR')">
										<li><a
											href="${pageContext.request.contextPath}/counselor/read">상담사
												등록 정보</a></li>
										<li><a
											href="${pageContext.request.contextPath}/psy/lo/signupArt">그림상담사
												신청</a></li>
										<li><a
											href="${pageContext.request.contextPath}/psy/lo/cancle">그림상담사
												해지</a></li>
										<li><a
											href="${pageContext.request.contextPath}/psy/lo/requestList">그림검사
												요청목록</a></li>
										<li><a
											href="${pageContext.request.contextPath}/counsel/listForCounselor?field=-1">상담예약
												요청목록</a></li>
										<li><a
											href="${pageContext.request.contextPath}/counsel/listForCounselor?field=3">상담글
												요청목록</a></li>
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
										<sec:authentication property="principal.name" />
										님
										<sec:authorize access="hasRole('ROLE_COUNSELOR')">
											(상담사)
										</sec:authorize>
									</h6> <!-- Authentication의 getPrincipal().getName() -> Principal은 Provider에서 Authentication 에 넣어준 VO(생성자 첫 매개변수) -->
								</li>
								<li style="vertical-align: middle;"><a
									href="javascript:logout();"
									style="color: #2A3855; padding-top: 0 !important; padding-bottom: 0 !important">logout</a></li>


								<form id="logoutForm"
									action="${pageContext.request.contextPath}/member/logout"
									method="post" style="display: none">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</form>
							</sec:authorize>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<section class="background-11" style="padding-top: 50px !important">
			<div class="container">
				<div class="row mt-6" style="margin-top: 10px !important">
					<div class="col"></div>
					<div class="col-12">
						<div
							class="background-white px-3 mt-6 px-0 py-5 px-lg-5 radius-secondary"
							style="margin-top: 20px !important">
							<h3 class="text-center fs-2 fs-md-3">내 상담예약</h3>
							<hr class="short"
								data-zanim='{"from":{"opacity":0,"width":0},"to":{"opacity":1,"width":"4.20873rem"},"duration":0.8}'
								data-zanim-trigger="scroll" />
							<br> <a
								href="${pageContext.request.contextPath}/counsel/myCounselList?field=-1"
								class="btn btn-outline-info btn-capsule">전체</a>&nbsp;&nbsp; <a
								href="${pageContext.request.contextPath}/counsel/myCounselList?field=0"
								class="btn btn-outline-info btn-capsule">대면</a>&nbsp;&nbsp; <a
								href="${pageContext.request.contextPath}/counsel/myCounselList?field=1"
								class="btn btn-outline-info btn-capsule">전화</a>&nbsp;&nbsp; <a
								href="${pageContext.request.contextPath}/counsel/myCounselList?field=2"
								class="btn btn-outline-info btn-capsule">채팅</a> <br> <br>
							<form method="post" name="reviewW" id="reviewW">
								<input type="hidden" id="memberCode" name="memberCode" value="" />
								<input type="hidden" id="counselCode" name="counselCode"
									value="" /> <input type="hidden" id="counselorCode"
									name="counselorCode" value="" />
								<table>
									<thead>
										<tr>
											<th>상담 유형</th>
											<th>상담사</th>
											<th>신청일</th>
											<th>예약일시</th>
											<th>진행 상황</th>
											<th>리뷰작성</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${!empty pageList.content}">
												<c:forEach items="${pageList.content}" var="counsel"
													varStatus="num">
													<tr>
														<c:choose>
															<c:when test="${counsel.counselCategory==0}">
																<td>대면</td>
															</c:when>
															<c:when test="${counsel.counselCategory==1}">
																<td>전화</td>
															</c:when>
															<c:when test="${counsel.counselCategory==2}">
																<td>채팅</td>
															</c:when>
														</c:choose>
														<td>${counsel.counselor.member.name}</td>
														<td>${fn:substring(counsel.counselReqDate,0,10)}</td>
														<td>${fn:substring(counsel.counselDate,0,10)}
															${fn:substring(counsel.counselDate,11,16)}</td>
														<c:choose>
															<c:when test="${counsel.counselState==0}">
																<td><button class="btn btn-warning btn-xs"
																		disabled="disabled">승인대기</button></td>
															</c:when>
															<c:when test="${counsel.counselState==1}">
																<td><button class="btn btn-danger btn-xs"
																		disabled="disabled">반려</button></td>
															</c:when>
															<c:when test="${counsel.counselState==2}">
																<td><button class="btn btn-success btn-xs"
																		disabled="disabled">승인</button></td>
															</c:when>
															<c:when test="${counsel.counselState==3}">
																<td><button class="btn btn-info btn-xs"
																		disabled="disabled">완료</button></td>
															</c:when>
														</c:choose>
														<c:choose>
															<c:when test="${counsel.counselState==3}">
																<td><input type="button" id="modalBtn_${num.index}"
																	name="modalBtn" class="btn btn-outline-primary btn-xs"
																	value="리뷰작성"> <input type="hidden"
																	id="memberCode_${num.index}" name="memberCode"
																	value="<sec:authentication property="principal.memberCode" />">
																	<input type="hidden" name="${_csrf.parameterName}"
																	value="${_csrf.token}" /> <input type="hidden"
																	id="counselorCode_${num.index}" name="counselorCode"
																	value="${counsel.counselor.counselorCode}"> <input
																	type="hidden" id="counselCode_${num.index}"
																	name="counselCode" value="${counsel.counselCode}">
																</td>
															</c:when>
															<c:otherwise>
																<td><input type="hidden" id="modalBtn_${num.index}"
																	name="modalBtn" class="btn btn-outline-primary btn-xs"
																	value="리뷰작성"></td>
															</c:otherwise>

														</c:choose>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="6"><h5>아직 예약한 상담이 없습니다.</h5></td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
								<!-- Modal -->
								<div class="modal" id="modal1">
									<input type="hidden" id="tgmemberCode" name="member" size="30"
										value=""> <input type="hidden" id="tgcounselorCode"
										name="counselor" size="30" value="">
									<table border="1">
										<tr>
											<td height="15" style="padding: 5px" colspan="2"
												bgcolor="#DEDCDC">
												<p align="center" style="margin-bottom: 0rem">
													<font color="black" size="3"><b>리뷰등록</b></font>
												</p>
											</td>
										</tr>
										<!-- <tr>
					<td width="150" height="20" style="vertical-align: center;">
					작성자
						
					</td>
					<td width="450" height="20"><b><span style="font-size: 9pt; margin: 2px;">
								<input type="hidden" id="tgmemberCode" name="member" size="30" value="" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;">
						</span></b></td>
				</tr> -->

										<!-- <tr>
					<td width="150" height="20" style="vertical-align: center; margin: 2px;">
						상담사
					</td>
					<td width="450" height="20"><b><span style="font-size: 9pt;">
						
						<input type="hidden" id="tgcounselorCode" name="counselor" size="30" value="" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;">
						
					</span></b></td>
				
				</tr> -->


										<tr>
											<td width="150" height="20"
												style="vertical-align: center; margin: 2px;">상담번호</td>
											<td width="450" height="20" align="left"><b><span
													style="font-size: 9pt;"> <input type="text"
														id="tgcounselCode" name="counsel" size="30" value=""
														style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;">
												</span></b></td>

										</tr>


										<tr>
											<td width="150" height="20"
												style="vertical-align: center; margin: 2px;">별 점</td>
											<td width="450" height="20"><b><span
													style="font-size: 9pt;"> <select name="star">
															<option value="">별점선택</option>
															<option value="1.0">★</option>
															<option value="2.0">★★</option>
															<option value="3.0">★★★</option>
															<option value="4.0">★★★★</option>
															<option value="5.0">★★★★★</option>
													</select>
												</span></b></td>
										</tr>
										<tr>
											<td width="150" height="20"
												style="vertical-align: center; margin: 2px;" colspan="2">
												리뷰 내용</td>
										</tr>
										<tr>
											<td width="450" height="20" colspan="2"><b><span
													style="font-size: 9pt; margin: 2px;"> <textarea
															cols="55" rows="5" name="reviewContent"></textarea>

												</span></b></td>
										</tr>
										<tr>
											<td width="450" height="20" colspan="2" align="center">
												<b> <span style="font-size: 9pt;"> <input
														type="button" id="reviewBtn" value=리뷰등록> <input
														type="button" id="backBtn" value="돌아가기">
												</span>
											</b>
											</td>
										</tr>
									</table>
								</div>

							</form>


							<c:if test="${!empty pageList.content}">
								<nav class="font-1 mt-5" aria-label="Page navigation example">
									<ul class="pagination pagination justify-content-center">
										<c:forEach begin="0" end="${pageList.totalPages-1}" var="i">
											<c:choose>
												<c:when test="${pageList.number==i}">
													<li class="page-item active"><a class="page-link"
														href="${pageContext.request.contextPath}/counsel/myCounselList?nowPage=${i}&field=${field}">${i+1}</a>
													</li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="${pageContext.request.contextPath}/counsel/myCounselList?nowPage=${i}&field=${field}">${i+1}</a>
													</li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</ul>
								</nav>
							</c:if>
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
	<!--모달 -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<!--  -->
	<style>
.modal {
	position: absolute;
	width: 100%;
	height: 60%;
	background: rgba(255, 255, 255, 255);
	top: 15%;
	left: 35%;
	display: none;
}
</style>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							/* $("input[name='modalBtn']").click(function() {
								var s = $("[name='modalBtn']").index(this)
								console.log(s); 
								console.log($('#memberCode_'+s).val());
								
								$('#tgmemberCode').val($('#memberCode_'+s).val());
								$('#tgcounselCode').val($('#counselor_'+s).val());
								$('#modal1').fadeIn();
							}); */

							$(document)
									.on(
											"click",
											"[name='modalBtn']",
											function() {
												var s = $("[name='modalBtn']")
														.index(this)
												alert($("[name='modalBtn']")
														.index(this));
												console.log(s);
												console.log($(
														'#memberCode_' + s)
														.val());
												console.log($(
														'#counselCode_' + s)
														.val());
												console.log($(
														'#counselorCode_' + s)
														.val());

												$('#tgmemberCode').val(
														$('#memberCode_' + s)
																.val());
												$('#tgcounselCode').val(
														$('#counselCode_' + s)
																.val());
												$('#tgcounselorCode')
														.val(
																$(
																		'#counselorCode_'
																				+ s)
																		.val());

												$('#modal1').fadeIn();

											})

							$('#reviewBtn')
									.click(
											function() {
												var param = document
														.getElementById('reviewW');
												if (reviewW.star.value == "") {
													alert("별점을 선택하세요");
													return false;
												}
												param.method = "GET";
												param.action = "${pageContext.request.contextPath}/review/insert";
												param.submit();
												$('#modal1').fadeOut();

											});

							$('#backBtn').click(function() {
								$('#modal1').fadeOut();
							});

						});
	</script>
</body>

</html>