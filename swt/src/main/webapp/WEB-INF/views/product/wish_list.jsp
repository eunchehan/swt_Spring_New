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
	
		<div class="lecture_box">
			<div class="empty_box">
			<div>
				<i class="fas fa-exclamation-circle empty_icon"></i>
			</div>
				추가된 강좌가 없습니다.
			</div>
		</div>
   		
	
			<div class="lecture_box">
				<div class="lecture_img_box">
					<a href="$">
						<img class="lecture_img" src="">
					</a>
				</div>
				<div class="lecture_text">
					<div class="lecture_title"><a href=""></a></div>
					<div class="lecture_bottom">
	                    <div>제품명ㅣ</div>
	                </div>
				</div>
				<div class="lecture_paytext">
					<div class="paytext_top">
						금액
					</div>
					<div class="paytext_price">
						<fmt:formatNumber value="" pattern="#,###원" />
					</div>
					
						<a><span class="cart_btn">장바구니에 추가</span></a>
					
					<a><span class="delete_btn">위시리스트 삭제</span></a>
				</div>
			</div>
		
</body>
</html>