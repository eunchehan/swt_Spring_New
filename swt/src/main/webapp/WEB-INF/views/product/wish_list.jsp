<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path}/resources/css/board.css?v=1"> 
<meta charset="UTF-8">
<title>위시리스트 목록</title>
</head>
<body>
	<c:choose>
		<c:when test="${empty wish}">
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
			<c:forEach items="${wish}" var="list">
			<div class="product_box">
				<div class="product_img_box">
					<a href="${path}/product/view?p_code=${list.P_CODE}">
						<img class="product_img" src="${path}/resources/images/${list.P_IMG}">
					</a>
				</div>
				<div class="product_text">
					<div class="product_title"><a href="${path}/product/view?p_code=${list.P_CODE}" id="productName">${list.P_NAME}</a></div>
					<div class="product_bottom">
	                    <div class="paytext_top">
						금액
						</div>
						<div class="paytext_price">
							<fmt:formatNumber value="${list.P_PRICE}" pattern="#,###원" />
						</div>
	                </div>
				</div>
				<div class="product_paytext">
					<c:if test="${empty list.ISEMPTY}">
						<a><span class="cart_btn" data-src="${list.P_CODE}">장바구니에 추가</span></a>
					</c:if>
					<a><span class="<c:out value="${empty list.ISEMPTY ? 'wish_btn':'noempty_btn'}"/>" data-src="${list.P_CODE}">위시리스트 삭제</span></a>
				</div>
			</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</body>
</html>