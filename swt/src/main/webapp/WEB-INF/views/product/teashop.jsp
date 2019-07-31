<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/board.css?v=1"> 
<title>TeaShop</title>
<style>
		a {
            cursor: pointer;
            text-decoration: none;
        }
		
		.info_title {
			font-size: 35px;
		    margin: 1rem auto;
		    padding: 0px 50px 0px;
		    position: relative;
		    box-sizing: border-box;
        }
        .info_title > span {
        	margin-left: 1.5rem;
        }
        .info_title_bar {
        	position: absolute;
        	width: 7px;
        	height: 32px;
        	top: 11.5px;
        	left: 30px;
        }
		.section_title {
			text-align: center;
			font-size: 25px;
			color: #2D314F;
			font-weight: 600;
			padding-bottom: 20px;
		}
		.pd_content {
			display: flex;
			justify-content: center;
		}
		.content_box {
			position: relative;
			width: 380px;
			padding: 12px 12px 70px;
			box-sizing: border-box;
		}
		.cart_icon {
			position: absolute;
			right: 26px;
			top: 26px;
			font-size: 22px;
			opacity: .5;
			transition: .2s;
		}
		.cart_icon:hover, .wish_icon:hover {
			opacity: 1;
		}
		
		.wish_icon {
			position: absolute;
		    right: 23.5px;
		    top: 60px;
		    font-size: 22px;
		    color: #FFC000!important;
		    opacity: .5;
		    transition: .2s;
		}
		
		.pd_img_wrap {
			width: 380px;
			height: 247px;
			border-radius: 5px;
			overflow: hidden;
		}
		.pd_img {
			width: 18rem;
		}
		.pd_name {
			font-size: 16px;
			padding: 15px 0px 10px;
			color: #2D314F;
			font-weight: 600;
			border-bottom: 4px double #dadada;
			height: 46px;
			text-align: center;
		}
		.pd_name > a {
			font-size: 1rem;
		}
		.pd_text {
			text-align: center;
		}
		
		
		.pd_wrap {
			margin: 0px auto;
		}
		.pd_content {
			display: inline-block;
		    position: relative;
		    width: 350px;
		    padding: 12px 12px 20px;
		    margin: 1rem;
		    box-sizing: border-box;
		    border: 3px double #e9ecef;
		}
		
		
</style>
</head>
<body>
	<div id="contentWrapper" class="content01 container">
		<div id="contentWrap">
			<%@ include file="../include/shop_aside.jsp" %>
			<div id="content">
				<div class="info_title"><span>베스트 상품</span>
	        		<div class="info_title_bar"><i class="far fa-heart"></i></div>
	        	</div>
				
				<div class="pd_wrap">
                	<c:forEach items="${map.bList}" var="bList">
	                    <div class="pd_content">
	                    	<div class="pd_img_wrap">
	                        	<a href="${path}/product/view?p_code=${bList.p_code}">
	                        		<img class="pd_img" src="${path}/resources/images/${bList.p_img}">
	                       		</a>
	                       	</div>
	                        <div class="pd_name">
	                        	<a href="${path}/product/view?p_code=${bList.p_code}">
	                            	${bList.p_name}
	                            </a>
	                        </div>
	                        <div class="pd_text">
	                            <span class="pd_price">${bList.p_price}원</span>
	                        </div>
	                       <!--  <a href="" class="cart_icon best_code"><i class="fas fa-cart-plus"></i></a>
	                        <a href="" class="wish_icon best_code"><i class="far fa-star"></i></a> -->
	                    </div>
                    </c:forEach>
                </div>
                <div class="info_title"><span>신상품</span>
	        		<div class="info_title_bar"><i class="fas fa-check"></i></div>
	        	</div>
                <div class="pd_wrap">
                	<c:forEach items="${map.nList}" var="nList">
	                    <div class="pd_content">
	                    	<div class="pd_img_wrap">
	                        	<a href="${path}/product/view?p_code=${nList.p_code}">
	                        		<img class="pd_img" src="${path}/resources/images/${nList.p_img}">
	                       		</a>
	                       	</div>
	                        <div class="pd_name">
	                        	<a href="${path}/product/view?p_code=${nList.p_code}">
	                            	${nList.p_name}
	                            </a>
	                        </div>
	                        <div class="pd_text">
	                            <span class="pd_price">${nList.p_price}원</span>
	                        </div>
	                       <!--  <a href="" class="cart_icon new_code"><i class="fas fa-cart-plus"></i></a>
	                        <a href="" class="wish_icon new_code"><i class="far fa-star"></i></a> -->
	                    </div>
                    </c:forEach>
                </div>		
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
	
</body>
</html>