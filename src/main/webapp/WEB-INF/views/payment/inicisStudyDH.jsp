<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
	/* String name = (String)request.getParameter("name");
	String phone = (String)request.getParameter("phone");
	String email = (String)request.getParameter("email");
	String addr = (String)request.getParameter("addr");
	String ticketType = (String)request.getParameter("ticketType"); */

	String name = (String)request.getAttribute("name");
	String phone = (String)request.getAttribute("phone");
	String email = (String)request.getAttribute("email");
	String addr = (String)request.getAttribute("addr");
	String ticketType = (String)request.getAttribute("ticketType");
	
	String ticketField = (String)request.getParameter("ticketField");
	int field = Integer.parseInt(ticketField);
	String totalPrice = (String)request.getParameter("ticketPrice");
	int price = Integer.parseInt(totalPrice);
	
	String counselorCode = (String)request.getParameter("counselorCode");
	String discountCode = (String)request.getParameter("discountCode");
	String ticketAmount = (String)request.getParameter("ticketAmount");
	String ticketRemain = (String)request.getParameter("ticketRemain");
	
	/* String totalPrice = (String)request.getParameter("ticketPrice");
	int price = Integer.parseInt(totalPrice); */
	
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
\${ticketPrice}=${ticketPrice}
    <script>
    
    $(function(){
    	
    	<%-- console.log(${name});
    	console.log(${phone});
    	console.log(${email});
    	console.log(${addr});
    	console.log(${ticketType});
    	
    	console.log(<%=price%>);
    	console.log(<%=name%>);
    	console.log(<%=phone%>);
    	console.log(<%=email%>);
    	console.log(<%=addr%>);
    	console.log(<%=ticketField%>);
    	console.log(<%=totalPrice%>);
    	console.log(<%=counselorCode%>);
    	console.log(<%=discountCode%>);
    	console.log(<%=ticketAmount%>);
    	console.log(<%=ticketRemain%>); --%>
    	
        var IMP = window.IMP;
        IMP.init('imp75728843'); //가맹점 식별코드
        var msg;
        
     
        alert("${email}")
        alert("${ticketType}")
        alert("${name}")
        alert("${phone}")
        alert("${addr}")
           alert(Number("${ticketPrice}"))
        
        IMP.request_pay({
            
        	/* pg : 'html5_inicis', //다수의 PG 사용시 필수
          	pay_method : 'card',
   			merchant_uid : 'merchant_' + new Date().getTime(),  //필수항목
    		name : 'BesideU 상담권',
    		amount : '1000',  //필수항목
    		buyer_email : 'abcd@email.com',
    		buyer_name : '김회원',
    		buyer_tel : '010-2345-6789',  //필수항목
    		buyer_addr : '경기도 성남시' */
        	
            pg : 'html5_inicis', //다수의 PG 사용시 필수
          	pay_method : 'card',
   			merchant_uid : 'merchant_' + new Date().getTime(),  //필수항목
    		name : "${ticketType}",
    		amount : Number("${ticketPrice}"),  //필수항목
    		buyer_email :"${email}",
    		buyer_name : "${name}",
    		buyer_tel : "${phone}",  //필수항목
    		buyer_addr : "${addr}"
    		
    		/* pg : 'html5_inicis', //다수의 PG 사용시 필수
          	pay_method : 'card',
   			merchant_uid : 'merchant_' + new Date().getTime(),  //필수항목
    		name : ${ticketType},
    		amount : ${price},  //필수항목
    		buyer_email : ${email},
    		buyer_name : ${name},
    		buyer_tel : ${phone},  //필수항목
    		buyer_addr : ${addr} */
    		
    		//buyer_postcode : '123-456'
    		//m_redirect_url : 'https://shop.yourservice.com/payments/complete'
            
        }, function(rsp) {
        	alert("rsp : " + rsp.success) ;
        	
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
                
                <%-- var frd = <%=ticketField%>;
                var code = <%=counselorCode%>;
                var amt = <%=ticketAmount%>;
                var rmn = <%=ticketRemain%>;
                var dc = <%=discountCode%>;
                var prc = <%=totalPrice%>;
                
                sessionStorage.setItem("ticketField", frd);
                sessionStorage.setItem("counselorCode", code);
                sessionStorage.setItem("ticketAmount", amt);
                sessionStorage.setItem("ticketRemain", rmn);
                sessionStorage.setItem("discountCode", dc);
                sessionStorage.setItem("ticketPrice", prc); --%>
                
                /* console.log(frd);
                console.log(code);
                console.log(amt);
                console.log(rmn);
                console.log(dc);
                console.log(prc); */
                
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
