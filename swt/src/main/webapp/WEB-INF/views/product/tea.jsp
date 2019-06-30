<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/board.css?v=1"> 
<title>Tea</title>
</head>
<body>
	<div id="contentWrapper" class="content01 container">
		<div id="contentWrap">
			<%@ include file="../include/shop_aside.jsp" %>
			<div id="content">
				<div class="all_content">
                	<c:forEach items="${map.list}" var="list">
	                    <div class="all_content_box">
	                    	<div class="section_img">
	                        	<a href="${path}/lecture/view?lno=${list.p_code}">
	                        		<img class="lecture_img" src="${path}/resources/img/${list.p_img}">
	                       		</a>
	                       	</div>
	                        <div class="section_name">
	                        	<a href="${path}/lecture/view?lno=${list.p_code}">
	                            	${list.p_name}
	                            </a>
	                        </div>
	                        <div class="section_text">
	                            <span class="section_price">${list.p_price}원</span>
	                        </div>
	                        <a href=""><i class="fas fa-cart-plus"></i></a>
	                    </div>
                    </c:forEach>
                </div>	
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>