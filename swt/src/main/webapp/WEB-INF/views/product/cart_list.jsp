<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path}/resources/css/board.css?v=1"> 
<meta charset="UTF-8">
<title>장바구니 목록</title>
</head>
<body>
	<div class="container_all">
        <div class="product_container">
   		<c:choose>
   		<c:when test="${empty cart}">
		<div class="product_box">
			<div class="empty_box">
				<div>
					<i class="fas fa-exclamation-circle empty_icon"></i>
				</div>
				추가된 상품이 없습니다.
			</div>
		</div>
   		</c:when>
   		<c:otherwise>
   		<c:forEach items="${cart}" var="list" varStatus="status">
		<div class="product_flex">
			<div class="product_box">
				<div class="product_img_box">
					<a href="${path}/product/view?p_code=${list.P_CODE}">
						<img class="product_img" src="${path}/resources/images/${list.P_IMG}">
					</a>
				</div>
				<div class="product_text">
					<div class="product_title"><a id="productName">${list.P_NAME}</a></div>
					<div class="product_bottom">
						<div class="paytext_top">
							수량: <input type="text" class="pdAmount" value="${list.AMOUNT}" data-modi="${list.P_CODE}" name="amount">개
							<a class="modiAmount" data-modiCode="${list.P_CODE}" data-modiId="${list.CART_ID}">변경</a>
						</div>
						<div class="paytext_price">
							금액: ${list.MONEY}원
						</div>
	                </div>
				</div>
				<div class="product_paytext">
					<a><span class="delete_btn" data-src="${list.P_CODE}" data-index="${list.CART_ID}">상품 삭제</span></a>
				</div>
			</div>
		</div>
		</c:forEach>
		</c:otherwise>
		</c:choose>
		</div>
		<c:if test="${!empty cart && !empty total}">
		<div class="pay_container">
	   		<div class="pay_box">
		        <div class="price_title_box">
		            <span class="price_title">총계</span>
		            <span class="price_num">${total}</span>
		        </div>
		        <div class="pay_info_box">
					<span class="pay_check">
					    <input type="checkbox" id="onecheck">
					    <div class="check_label">
						    <label for="onecheck">
						    		<i class="fas fa-check-circle" id="check_icon"></i>
						    		<span class="check_text">[필수] 구매조건 및 결제대행 서비스 약관 동의</span>
						    </label>
					    </div>
					</span>
		        </div>
		        <div class="err_msg">* 필수약관에 동의해주세요.</div>
		        <div class="pay_btn"><span class="pay_btn_text">결 제 하 기</span></div>
	        </div>
       	</div>
        </c:if>
 	</div>
</body>
</html>