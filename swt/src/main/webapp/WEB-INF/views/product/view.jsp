<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/board.css?v=1"> 
<title>상품 상세</title>
<style type="text/css">
	@import url('https://fonts.googleapis.com/css?family=Nanum+Myeongjo');
	@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR');
	
	dd {
	    display: block;
	    margin-inline-start: 40px;
	}
	img {
		vertical-align: top;
	}
	img, fieldset, button {
		border: 0 none;
	}
	table {
	    width: 100%;
	    border-collapse: collapse;
	    border-spacing: 0;
	    table-layout: fixed;
	    word-wrap: break-word;
	    word-break: keep-all;
	}
	hr, caption, legend {
		display: none;
	}
	caption {
		/*display: table-caption;*/
		text-align: -webkit-center;
	}
	colgroup {
		display: table-column-group;
	}
	col {
		display: table-column;
	}
	tbody {
	    display: table-row-group;
	    vertical-align: middle;
	    border-color: inherit;
	}
	tr {
	    display: table-row;
	    vertical-align: inherit;
	    border-color: inherit;
	    width: 30%;
	}
	td, th {
		display: table-cell;
		vertical-align: inherit;
		width: 70%;
	}
	select {
	    line-height: 18px;
	    height: 30px;
	    /*width: 125px;*/
	    border-radius: 0px;
	    border-color: rgb(169, 169, 169);
	    -webkit-appearance: menulist;
	    box-sizing: border-box;
	    align-items: center;
	    white-space: pre;
	    color: black;
	    background-color: white;
	    cursor: default;
	    border-width: 1px;
	    border-style: solid;
	    border-color: initial;
	    border-image: initial;
	}
	option {
	    font-weight: normal;
	    display: block;
	    white-space: pre;
	    min-height: 1.2em;
	    padding: 0px 2px 1px;
	}
	button, input, select, textarea, a {
	    vertical-align: middle;
	}
	select:not(:-internal-list-box) {
	    overflow: visible !important;
	}
	#productDetail .loc-navi {
   		padding-bottom: 10px;
	}
	.loc-navi, .loc-navi a {
	    color: #999;
	    text-transform: uppercase;
	}
	.loc-navi {
	    text-align: right;
	}
	#productDetail .loc-navi dd {
	    color: #969696;
	    font-size: 12px;
	}
	.ir *, .blind {
	    z-index: -1;
	    position: absolute;
	    display: block;
	    left: 0;
	    top: 0;
	    overflow: hidden;
	    visibility: hidden;
	    width: 0;
	    height: 0;
	    text-indent: -9999px;
	}
	#productDetail .thumb-info {
	    zoom: 1;
	}
	#productDetail .thumb-info .thumb-wrap {
        display: flex;
    	flex-direction: row;
	}
	#productDetail .thumb-info .thumb {
	    text-align: center;
	    margin: 0 auto;
	    order: 1;
	    flex: 5;
	}
	#productDetail .thumb-info .thumb img {
       padding: 3rem 0px;
	    width: 100%;
	    height: 80%;
	}
	#productDetail .thumb-info .thumb-ctrl {
	    clear: both;
	    padding-top: 20px;
	    text-align: center;
	}
	#productDetail .thumb-info .thumb-ctrl a {
	    font-size: 11px;
	}
	#productDetail .thumb-info .thumb-ctrl a img {
	    vertical-align: middle;
	    margin-right: 3px;
	}
	#productDetail .thumb-info .info {
		order: 2;
		flex: 5;
	}
	#productDetail .thumb-info .info>div {
	    padding-left: 20px;
	}
	#productDetail .thumb-info .info .tit-prd {
	    font-weight: bold;
	    font-size: 20px;
	    color:  #252851; /*#1e1e1e*/
	    padding: 20px 0px;
	    border-top: 2px solid #252851;
	    text-align: center;
	}
	#productDetail .thumb-info .product_addinfo {
	    color: #252851; /*#323232*/
	    font-size: 14px;
	    line-height: 24px;
	    padding: 18px 0;
	    font-weight: bold;
	    border-top: 1px solid #dcdcdc;
	    border-bottom: 1px solid #dcdcdc;
	}
	#productDetail .thumb-info .product_addinfo span {
	    font-weight: normal;
	    /*color: #646464;*/
	    margin-left: 10px;
	    letter-spacing: -0.4px;
	    color: black;
	}
	#productDetail .thumb-info .info .table-opt {
	    margin-top: 10px;
	}
	#productDetail .thumb-info .info .table-opt th {
	    font-weight: normal;
	    font-size: 14px;
	    color: #646464;
	    letter-spacing: -.04em;
	}
	#productDetail .thumb-info .info .table-opt th, #productDetail .thumb-info .info .table-opt td {
	    font-size: 14px;
	    padding: 8px 0;
	    color: #252851;
	   /* color: #797979;*/
	}
	#productDetail .thumb-info .info .table-opt th.row .tb-left {
	    padding: 0;
	}
	.tb-left {
		text-align: left;
	}
	.tb-left, .tb-center, .tb-right {
	    padding: 0 10px;
	}
	#productDetail .thumb-info .info .prd-btns {
	    margin-top: 16px;
	}
	#productDetail .thumb-info .info .prd-btns a.detail_buy_now {
	    width: 100%;
	    display: block;
	    background-color: #252851;
	    color: #fff;
	    font-size: 16px;
	    padding: 15px 0;
	    margin-bottom: 10px;
	    text-align: center;
	}
	
	.prd-btns > a > img {
		display: flex;
	    justify-content: center;
		align-items: center;
	    width: 100%;
	    height: 8%;
	    padding: 0.1rem 0;
	}
	#pricevalue {
		font-size: 17px;
		font-weight: bold;
	}
	/* 수량 버튼  */
	/* #productDetail .thumb-info .info .table-opt .opt-spin .btns {
	    width: 25px;
	    display: flex;
	    flex-direction: column;
	    justify-content: center;

	}
	.btns > a {
		font-size: 15px;
	}
	.btns > a > i:first {
		order: 1;
		padding: -10px 0;
	}
	.btns > a > i:last {
		order: 2;
	}
	.opt-spin {
		position: relative;
	}
	.btns {
		position: absolute;
		top: -0px;
		left: 80px;
	}
	.btn-up {
		height: 2px;
	 }
	 .btn-down {
		height: 2px;
	 } */

	.sns{
		height: 35px;
	}
	.sns>a {
		font-size: 14px;
	}

	.view_sns_btn {
		display: inline-block;
		width: 40px;
		height: 40px;
		margin: 0 10px;
		overflow: hidden;
		position: relative;
		text-align: center;
	}
	.view_sns_btn i {
		line-height: 40px;
		font-size: 1.5em;
		transition: 0.2s linear;
	}
	.view_sns_btn:hover i{
		transform: scale(1.5); 
	}
	
	.wish_btn {
	    font-size: 1.6rem;
    	position: relative;
    	bottom: 0.3rem;
	}
    #wish_star {
    	color: yellow;
    }
  

</style>
</head>
<body>
	<div id="contentWrapper" class="content01 container">
		<div id="contentWrap">
			<%@ include file="../include/shop_aside.jsp" %>
			<div id="content">
				<div id="productDetail">
					<dl class="loc-navi">
						<dt class="blind">현재 위치</dt>
						<dd>
							<a href="#">Tea Shop</a>
							<span>></span>
							<a href="#">${one.p_type}</a>
							<span>></span>
							<a href="#">${one.p_name}</a>
						</dd>
					</dl>
					<div class="thumb-info">
						<div class="thumb-wrap">
							<div class="thumb">
								<img src="${path}/resources/images/${one.p_img}">
							</div>
							<div class="info">
								<div>
									
									<h3 class="tit-prd">
										<a class="wish_btn"><i class="far fa-star" id="wish_star"></i></a>
										${one.p_name}
									</h3>
									<div class="product_addinfo">
										<div class="addinfo02">
											종류: 
											<span>홍차</span>
										</div>
										<div class="addinfo02">
											설명: 
											<span>천연 베르가못 오일의 진한 여운이 특징인 홍차</span>
										</div>
									</div>
									<div class="table-opt">
										<table summary="판매가격, 적립금, 주문수량, sns">
											<caption>상품 옵션</caption>
											<tbody>
												<tr>
													<td class="price">
														<div class="tb-left">가 격</div>
														<div class="tb-left">
															<span id="pricevalue" class="price">${one.p_price}</span>
															원
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="tb-left">적립금</div>
														<div class="tb-left">
															3%
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="tb-left">수 량</div>
														<div class="tb-left">
															<div class="opt-spin">
																<select id="amount" name="amount">
																	<option value="1" selected="selected">1</option>
																	<option value="2">2</option>
																	<option value="3">3</option>
																	<option value="4">4</option>
																	<option value="5">5</option>
																</select>
															</div>
														</div>
													</td>
												</tr>
												<tr class="sns_share">
													<td>
														<div class="tb-left">SNS공유</div>
														<div class="tb-left">
															<div class="sns">
																<a href="https://www.instagram.com/" target="_blank" class="view_sns_btn">
																	<i class="fab fa-instagram"></i>
																</a>
																<a href="https://www.facebook.com/" target="_blank" class="view_sns_btn">
																	<i class="fab fa-facebook"></i>
																</a>
																<a href="https://twitter.com/?lang=ko" class="view_sns_btn"><i class="fab fa-twitter"></i></a>
															</div>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="prd-btns">
										<a href="#" class="detail_buy_now"><span>장바구니 담기</span></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
	
	<script type="text/javascript">
		var id = "${sessionScope.userid}";
		var p_code = "${one.p_code}";
    	$(document).ready(function(){
    		wishCheck();
    		
	    	$(".wish_btn").click(function(){
	    		wishUpdate();
	    	});
	    	$(".cart_btn").click(function(){
	    		cartAdd();
	    	});
    	});
    	
    	function wishCheck(){
    		$.ajax({
    			type: "POST",
    			url: "${path}/product/wish?p_code="+p_code+"&id="+id,
    			success: function(data){
    				if (data > 0) {
						$('.wish_btn').html('<i class="far fa-star" id="wish_star"></i>');
					} else {
						$('.wish_btn').html('<i class="fas fa-star" id="wish_star"></i>');
					}
    			}, error: function(){
    				alert("wishCheck error!!");
    			}
    			
    		});
    	}
   </script>
</body>
</html>