<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path}/resources/css/board.css?v=1"> 
<meta charset="UTF-8">
<title>위시리스트</title>
<style type="text/css">
.info_title {
	width: 1350px;
    font-size: 35px;
    margin: 0px auto;
    padding: 0px 75px 30px;
    position: relative;
    box-sizing: border-box;
}
.info_title_bar {
	position: absolute;
	top: 11.5px;
	left: 30px;
}
.product_box{
    margin: 25px auto;
    width: 50%;
    padding: 20px;
    background: white;
    display: flex;
    box-sizing: border-box;
    position: relative;
    min-width: 870px;
    border: 3px double #eee;
}
.empty_box {
	width: 100%;
	text-align: center;
	padding: 10px;
	color: tomato;
}
.empty_icon {
	font-size: 22px;
	padding-bottom: 5px;
	color: tomato;
}
.product_img_box{
	width: 200px;
	height: 128.9px;
	overflow: hidden;
}
.product_img{
	width: 100%;
    height: 130%;
    position: relative;
    bottom: 1.25rem;
}
.product_text{
	margin: 3px 0px 3px 30px;
	width: 455px;
	height: 100%;
	box-sizing: border-box;
}
.product_title {
	font-size: 20px;
	font-weight: bold;
}
.product_bottom {
	position: absolute;
	width: 455px;
	bottom: 25px;
	padding-top: 11px;
	border-top: 1px solid #dadada;
}
.product_paytext{
	position: absolute;
	right: 28px;
	top: 45px;
	width: 130px;
}

.paytext_price{
	font-size: 20px;
	flex:1;
}
.cart_btn {
	display: block;
	width: 110px;
	text-align: center;
	padding: 5px 7px;
	font-size: 13px;
	box-sizing: border-box;
	border: 1px solid #ddd;
	color: #999;
	margin-top: 10px;
	margin-left: 20px;
	transition: .2s;
}
.wish_btn {
	display: block;
	width: 110px;
	text-align: center;
	padding: 5px 7px;
	font-size: 13px;
	box-sizing: border-box;
	border: 1px solid #ddd;
	color: #999;
	margin-top: 5px;
	margin-left: 20px;
	transition: .2s;
}
.noempty_btn {
	display: block;
	width: 110px;
	text-align: center;
	padding: 5px 7px;
	font-size: 13px;
	box-sizing: border-box;
	border: 1px solid #ddd;
	color: #999;
	margin-top: 46px;
	margin-left: 20px;
	transition: .2s;
	border-radius: 15px;
}
.cart_btn:hover {
    color: #225285;
    border: 1px solid #225285;
}
.wish_btn:hover {
    color: #a03758;
    border: 1px solid #a03758;
}
.noempty_btn:hover {
	color: #FFC000;
	border: 1px solid #FFC000;
}
#productName {
	font-size: 1.5rem;
}
</style>
</head>
<body>
	<div id="contentWrapper" class="content01 container">
		<div id="contentWrap">
			<div>
				<!-- 가장 큰 박스 -->
				<div class="section_box">
					<div class="product_container">
						<div class="info_title">위시리스트
				        	<div class="info_title_bar"><i class="far fa-star" id="wish_star"></i></div>
				        </div>
				        <div id="wishlist"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
	<script type="text/javascript">
		$(document).ready(function(){
			wishList();
		});
		
		function wishList(){
			$.ajax({
				type: "GET",
				url: "${path}/product/wishList",
				success: function(result){
					$("#wishlist").html(result);
				}, error: function(){
					alert("wishList error!!");
				}
			});
		}
		
		$(document).on("click",".wish_btn", function(){
			var p_code = $(this).attr("data-src");
			$.ajax({
				type: "POST",
				url: "${path}/product/wishDelete?p_code="+p_code,
				success: function(){
					alert("성공적으로 삭제되었습니다.");
					wishList();
				}, error: function(){
					alert("wishDelete error!!");
				}		
			});
		});
		
		$(document).on("click", ".cart_btn", function(){
			var p_code = $(this).attr("data-src");
			$.ajax({
				type: "GET",
				url: "${path}/product/cartAdd?p_code="+p_code,
				success: function(data){
					if (data>0) {
						alert("장바구니로 등록되었습니다.");
					} else {
						alert("이미 등록된 상품입니다.");
					}
				}, error: function(){
					alert("cartAdd error!!");
				}
			});
		});
	</script>
</body>
</html>
