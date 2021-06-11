<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<style>
 a {text-decoration: none}
</style>


<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">
<caption>문의 LIST</caption>
	<colgroup>
		<col width="5%"/>
		<col width="10%"/>
		<col width="25%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
	</colgroup>
	<tr>
        <td bgcolor="#00cc00">
            <p align="center">
            <font color="white"><b><span style="font-size:9pt;">번호</span></b></font></p>
        </td>
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">카테고리</span></b></font></p>
        </td>
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">제목</span></b></font></p>
        </td>
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">작성자</span></b></font></p>
        </td>
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">등록일</span></b></font></p>
        </td>
        <td bgcolor="#00cc00">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">처리상태</span></b></font></p>
        </td>
    </tr>
    <c:choose>
    <c:when test="${empty requestScope.pageList}">
	<tr>
        <td colspan="5">
            <p align="center"><b><span style="font-size:9pt;">등록된 문의가 없습니다.</span></b></p>
        </td>
    </tr>
    </c:when>
    <c:otherwise>
	<c:forEach items="${requestScope.pageList.content}" var="contact"> <!-- pageList.getContent() -->
		    <tr onmouseover="this.style.background='#eaeaea'" onmouseout="this.style.background='white'">
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${contact.contactCode}</span></p>
		        </td>
		        
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${contact.contactCategory}</span></p>
		        </td>
		        
		        <td bgcolor="">
					<p><span style="font-size:9pt;">
					<a href="${pageContext.request.contextPath}/contact/read/${contact.contactCode}">
					  ${contact.contactTitle} <%-- /  Reply count : <b style="color:red">${contact.replyList.size()} --%></b>
					</a>
					</span></p>
		        </td>
		        
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${contact.member.id}</span></p>
		        </td>
		        
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${contact.contactDate}</span></p>
		        </td>
		        
		         <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${contact.contactState}</span></p>
		        </td>
		    </tr>
    </c:forEach>
	</c:otherwise>
    </c:choose>
</table>
<hr>
${pageList.hasPrevious()}  /  ${pageList.hasNext()}
<div style="text-align: center">
<!-- 페이징 처리 -->
 <c:forEach begin="0" end="${pageList.totalPages-1}" var="i"> <!-- pageList.getTotalPages()호출 (0부터 시작해서 -1) -->
   <c:choose>
     <c:when test="${pageList.number==i}">
         <a href="${pageContext.request.contextPath}/contact/list?nowPage=${i}" style="color:red"> [ ${i+1} ] </a>
     </c:when>
     <c:otherwise>
         <a href="${pageContext.request.contextPath}/contact/list?nowPage=${i}"> [ ${i+1} ] </a>
     </c:otherwise>
   </c:choose>
   
 </c:forEach>
</div>

<div align=right>
<span style="font-size:9pt;">&lt;<a href="${pageContext.request.contextPath}/contact/write">글쓰기</a>&gt;</span></div>














