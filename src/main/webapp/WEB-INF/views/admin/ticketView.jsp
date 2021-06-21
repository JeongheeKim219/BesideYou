<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Language" content="ko">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Analytics Dashboard - This is an example dashboard
	created using build-in elements and components.</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
<meta name="description"
	content="This is an example dashboard created using build-in elements and components.">
<meta name="msapplication-tap-highlight" content="no">
<!--
    =========================================================
    * ArchitectUI HTML Theme Dashboard - v1.0.0
    =========================================================
    * Product Page: https://dashboardpack.com
    * Copyright 2019 DashboardPack (https://dashboardpack.com)
    * Licensed under MIT (https://github.com/DashboardPack/architectui-html-theme-free/blob/master/LICENSE)
    =========================================================
    * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
    -->
<link href="${pageContext.request.contextPath}/adminCss/main.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/adminCss/jquery-ui.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/adminCss/jquery-ui.theme.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/adminCss/jquery-ui.theme.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {

		fn_default_datepicker();

	})//제이 쿼리 Ready

	function fn_default_datepicker() {
		var start = $("#from").datepicker(
				{
					dateFormat : 'yy-mm-dd' //Input Display Format 변경
					,
					showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
					,
					showMonthAfterYear : true //년도 먼저 나오고, 뒤에 월 표시
					,
					changeYear : true //콤보박스에서 년 선택 가능
					,
					changeMonth : true //콤보박스에서 월 선택 가능                
					//,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
					//,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
					//,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
					,
					buttonText : "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
					,
					yearSuffix : "년" //달력의 년도 부분 뒤에 붙는 텍스트
					,
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 텍스트
					,
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
					,
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 부분 텍스트
					,
					dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
							'토요일' ] //달력의 요일 부분 Tooltip 텍스트
					/* ,
					minDate : "-1D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
					,
					maxDate : "-1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)    */             
				});

		var end = $("#to").datepicker(
				{
					dateFormat : 'yy-mm-dd' //Input Display Format 변경
					,
					showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
					,
					showMonthAfterYear : true //년도 먼저 나오고, 뒤에 월 표시
					,
					changeYear : true //콤보박스에서 년 선택 가능
					,
					changeMonth : true //콤보박스에서 월 선택 가능                
					//,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
					//,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
					//,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
					,
					buttonText : "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
					,
					yearSuffix : "년" //달력의 년도 부분 뒤에 붙는 텍스트
					,
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 텍스트
					,
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
					,
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 부분 텍스트
					,
					dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
							'토요일' ] //달력의 요일 부분 Tooltip 텍스트
					,
					/* minDate : "-1D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
					,
					maxDate : "-1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
					, */
					defaultDate : "+1w"
				});

		//초기값을 오늘 날짜로 설정
		$('#from').datepicker('setDate', '-7D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
		$('#to').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	}

	function getDate(element) {
		var date;
		var dateFormat = "yy-mm-dd";
		try {
			date = $.datepicker.parseDate(dateFormat, element.value);
		} catch (error) {
			date = null;
		}
		return date;
	}
</script>
</head>
<body>
	<%@include file="./header.jsp"%>
	<%@include file="./menu.jsp"%>
	<div class="app-main">
		<div class="app-main__outer">
			<div class="app-main__inner">
				<div class="app-page-title">
					<div class="page-title-wrapper">
						<div class="page-title-heading">
							<div class="page-title-icon">
								<i class="fa fa-address-book icon-gradient bg-mean-fruit"> </i>
							</div>
							<div>
								전체 회원 목록
								<div class="page-title-subheading">일반 회원, 상담사 회원 모두 조회
									가능합니다.</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="main-card mb-3 card">
						<div class="card-header" style="justify-content: flex-end;">
							<div class="widget-content widget-content-right">
								<form
									action="${pageContext.request.contextPath}/admin/selectTicketBetween"
									method="get">
									<div class="input-group">
										<label for="from"></label> <input type="text" id="from"
											name="from"> <label for="to"> ~ </label> <input
											type="text" id="to" name="to">
										<div class="input-group-append">
											<input type="submit" aria-haspopup="true"
												aria-expanded="false"
												class="btn btn-secondary" value="기간">
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="card-body">
							<table class="mb-0 table table-hover">
								<thead>
									<tr>
										<th>사용 상담권</th>
										<th>구매자</th>
										<th>상담권 종류</th>
										<th>상담권 수량</th>
										<th>할인률</th>
										<th>결제금액</th>
										<th>상담권 구매일</th>
									</tr>
								</thead>
								<c:choose>
									<c:when test="${empty requestScope.tkList}">
										<tr>
											<td colspan="7"><p align="center">결제내역이 없습니다.</p></td>
										</tr>
									</c:when>
									<c:when test="${not empty requestScope.errorMessage}">
										<tr>
											<td colspan="7"><p align="center">${requestScope.errorMessage}</p></td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${requestScope.tkList.content}" var="tkList"
											varStatus="state">
											<c:set value="${tkList.discount.discountRate}" var="rate"></c:set>
											<c:set value="${tkList.ticketPrice}" var="price"></c:set>

											<%
											int rate = (int) pageContext.getAttribute("rate");
											int price = (int) pageContext.getAttribute("price");

											double totalPrice = price * (1 - (rate * 0.01));
											pageContext.setAttribute("totalPrice", totalPrice);
											%>

											<tbody>

												<tr>
													<th scope="row">${tkList.ticketCode}</th>
													<td>${tkList.member.id}</td>
													<c:choose>
														<c:when test="${tkList.ticketField==0}">
															<td>대면상담</td>
														</c:when>
														<c:when test="${tkList.ticketField==1}">
															<td>전화상담</td>
														</c:when>
														<c:when test="${tkList.ticketField==2}">
															<td>채팅상담</td>
														</c:when>
														<c:when test="${tkList.ticketField==3}">
															<td>텍스트 테라피</td>
														</c:when>
													</c:choose>
													<td>${tkList.ticketAmount}</td>
													<c:choose>
														<c:when test="${tkList.discount.discountRate == 0}">
															<td>해당없음</td>
														</c:when>
														<c:otherwise>
															<td>${tkList.discount.discountRate}%</td>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${tkList.discount.discountRate == 0}">
															<td><span><fmt:formatNumber type="currency"
																		value="${totalPrice}" /></span></td>
														</c:when>
														<c:otherwise>
															<td><span><fmt:formatNumber type="currency"
																		value="${totalPrice}" /></span><br> <span
																style="text-decoration: line-through; font-size: x-small;"><fmt:formatNumber
																		type="currency" value="${tkList.ticketPrice}" /></span></td>
														</c:otherwise>
													</c:choose>
													<fmt:parseDate var="parseDate" pattern="yyyy-MM-dd'T'HH:mm"
														value="${tkList.ticketDate}" type="both" />
													<td><fmt:formatDate value="${parseDate}"
															pattern="yyyy-MM-dd HH:mm" /></td>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</table>
							<c:choose>
								<c:when test="${empty requestScope.errorMessage}">
									<ul class="pagination">
										<li class="page-item"><a href="javascript:void(0);"
											class="page-link" aria-label="Previous"><span
												aria-hidden="false">«</span><span class="sr-only">이전</span></a></li>
										<c:forEach begin="0" end="${tkList.totalPages-1}" var="i">
											<c:choose>
												<c:when test="${tkList.number==i}">
													<li class="page-item active"><a
														href="${pageContext.request.contextPath}/admin/ticketView?nowPage=${i}"
														class="page-link">${i+1}</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a
														href="${pageContext.request.contextPath}/admin/ticketView?nowPage=${i}"
														class="page-link">${i+1}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<li class="page-item"><a href="javascript:void(0);"
											class="page-link" aria-label="Next"><span
												aria-hidden="true">»</span><span class="sr-only">이후</span></a></li>
									</ul>
								</c:when>
							</c:choose>

						</div>
					</div>
				</div>
			</div>


		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#from").on("click",function(){
		        
		    });
		 
		     $("#from").on("change",function(e){
		         var end = $( "#to" ).datepicker( "option", "today", getDate( e.target ) );
		     });
		     
		     $("#from").on("change",function(e){
		         
		     });
		     
		     /* $("#date_search").on("click",function(){
		         var start = $("#datepicker_start").val();
		         var end = $("#datepicker_end").val();
		     });     */		
		})//제이 쿼리 Ready
	</script>
</body>
</html>