<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
<style>
 a {text-decoration: none}
</style>


<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">
<caption>환불 신청 내역</caption>
	<colgroup>
		<col width="15%"/>
		<col width="30%"/>
		<col width="16%"/>
		<col width="16%"/>
		<col width="7%"/>
		<col width="7%"/>
		<col width="7%"/>
	</colgroup>
	<tr>
        <td bgcolor="#00cc00">
            <p align="center">
            <font color="white"><b><span style="font-size:9pt;">NO</span></b></font></p>
        </td>
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">TICKET</span></b></font></p>
        </td>
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">USERID</span></b></font></p>
        </td>
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">REGDATE</span></b></font></p>
        </td>
       
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">STATE</span></b></font></p>
        </td>
    </tr>
    <c:choose>
    <c:when test="${empty requestScope.rfList.content}">
	<tr>
        <td colspan="5">
            <p align="center"><b><span style="font-size:15pt;">환불 신청 내역이 없습니다.</span></b></p>
        </td>
    </tr>
    </c:when>
    <c:otherwise>
	<c:forEach items="${requestScope.rfList.content}" var="refund" varStatus="status">
		    <tr onmouseover="this.style.background='#eaeaea'" onmouseout="this.style.background='white'">
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${status.count}</span></p>
		        </td>
		        <td bgcolor="">
					<p align="center"><span style="font-size:9pt;">
					<%-- <a href="${pageContext.request.contextPath}/board/read/${board.bno}"> --%> <!-- controller 에서 @PathVariable 사용해서 주소를 인수로 받음 -->
					  <c:choose>
					  	<c:when test="${refund.ticket.ticketField==0}">대면상담권</c:when>
					  	<c:when test="${refund.ticket.ticketField==1}">전화상담권</c:when>
					  	<c:when test="${refund.ticket.ticketField==2}">채팅상담권</c:when>
					  	<c:when test="${refund.ticket.ticketField==3}">간편텍스트상담권</c:when>
					  </c:choose>
					<!-- </a> -->
					</span></p>
		        </td>
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${refund.ticket.member.id}</span></p>
		        </td>
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${refund.refundDate}</span></p>
		        </td>
		         <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            <c:choose>
					  	<c:when test="${refund.refundState==0}">처리중</c:when>
					  	<c:when test="${refund.refundState==1}" ><span style="color:red">환불 불가</span></c:when>
					  	<c:when test="${refund.refundState==2}">환불 완료</c:when>
					  </c:choose>
		            </span></p>
		        </td>
		    </tr>
    </c:forEach>
	</c:otherwise>
    </c:choose>
</table>
<hr>
<div style="text-align: center">
<!-- 페이징 처리 -->
 <c:forEach begin="0" end="${rfList.totalPages-1}" var="i"> <!-- pageList.getTotalPages() : 페이지 수 만큼 반복문 돌기(0부터 시작하기 때문에 -1 해준다.) -->
   <c:choose>
     <c:when test="${rfList.number==i}"> <!-- pageList.getNumber() 호출 : 현재 페이지 번호 -->
         <a href="${pageContext.request.contextPath}/refund/list?nowPage=${i}" style="color:red"> [ ${i+1} ] </a> <!-- 현재 페이지만 빨간색으로 표시 -->
     </c:when>
     <c:otherwise>
         <a href="${pageContext.request.contextPath}/refund/list?nowPage=${i}"> [ ${i+1} ] </a>
     </c:otherwise>
   </c:choose>
   
 </c:forEach>
</div>

