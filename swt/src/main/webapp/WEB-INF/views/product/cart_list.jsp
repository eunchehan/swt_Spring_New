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
        <div class="lecture_container">
   		
		<div class="lecture_box">
			<div class="empty_box">
				<div>
					<i class="fas fa-exclamation-circle empty_icon"></i>
				</div>
				추가된 강좌가 없습니다.
			</div>
		</div>
   	
   		
		<div class="lecture_flex">
			<div class="lecture_box">
				<div class="lecture_img_box">
					<a href="">
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
					<a><span class="delete_btn" data-src="" data-index="">장바구니 삭제</span></a>
				</div>
			</div>
		</div>
		
		</div>
		
		<div class="pay_container">
	   		<div class="pay_box">
		        <div class="price_title_box">
		            <span class="price_title">총계</span>
		            <span class="price_num"><fmt:formatNumber value="" pattern="#,###원"/></span>
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
       
 	</div>
</body>
</html>