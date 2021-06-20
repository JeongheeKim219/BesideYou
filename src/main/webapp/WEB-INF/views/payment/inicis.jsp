<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String name = (String)request.getParameter("name");
	String phone = (String)request.getParameter("phone");
	String email = (String)request.getParameter("email");
	String addr = (String)request.getParameter("addr");
	String type = (String)request.getParameter("ticketType");
	String ticketField = (String)request.getParameter("ticketField");
	int field = Integer.parseInt(ticketField);
	String totalPrice = (String)request.getParameter("ticketPrice");
	int price = Integer.parseInt(totalPrice);
	
	/////////////////////////////////////////////////////////////////
	
	String counselorCode = (String)request.getParameter("counselorCode");
	String discountCode = (String)request.getParameter("discountCode");
	String ticketAmount = (String)request.getParameter("ticketAmount");
	String ticketRemain = (String)request.getParameter("ticketRemain");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
    <script>
    $(function(){
        var IMP = window.IMP;
        IMP.init('imp75728843'); //가맹점 식별코드
        var msg;
        
        IMP.request_pay({
            
            pg : 'html5_inicis', //다수의 PG 사용시 필수
          	pay_method : 'card',
   			merchant_uid : 'merchant_' + new Date().getTime(),  //필수항목
    		name : 'BesideU 상담권',
    		amount : '1000'<%-- <%=price%> --%>,  //필수항목
    		buyer_email : <%=email%>,
    		buyer_name : <%=name%>,
    		buyer_tel : <%=phone%>,  //필수항목
    		buyer_addr : <%=addr%>
    		//buyer_postcode : '123-456'
    		//m_redirect_url : 'https://shop.yourservice.com/payments/complete'
            
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                    	msg = '결제가 정상적으로 완료되지 않아 자동취소되었습니다.';
                    	alert(msg);
                    }
                });
                //성공시 이동할 페이지
                <%-- location.href='<%=request.getContextPath()%>/payment/paySuccess?msg='+msg; --%>
                <%-- location.href="<%=request.getContextPath()%>/front?key=sucBid&methodName=changeState&sucBidCode="+sucBidCode; --%>

                <%-- var code = <%=sucBidCode%>;
                location.href="${path}/front?key=sucBid&methodName=changeState&sucBidCode="+code;  --%>
                
                var ticketField = <%=field%>;
                var counselorCode = <%=counselorCode%>;
                var ticketAmount = <%=ticketAmount%>;
                var ticketRemain = <%=ticketRemain%>;
                var discountCode = <%=discountCode%>;
                var ticketPrice = <%=totalPrice%>;
                
                sessionStorage.setItem("ticketField", ticketField);
                sessionStorage.setItem("counselorCode", counselorCode);
                sessionStorage.setItem("ticketAmount", ticketAmount);
                sessionStorage.setItem("ticketRemain", ticketRemain);
                sessionStorage.setItem("discountCode", discountCode);
                sessionStorage.setItem("ticketPrice", ticketPrice);
                
                location.href="${pageContext.request.contextPath}/ticket/buy";
                
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                <%-- location.href="<%=request.getContextPath()%>/payment/payFail"; --%>
                location.href="${pageContext.request.contextPath}/payment/fail";
                //alert(msg);
            }
        });
        
    });
    </script>
 
</body>
</html>
