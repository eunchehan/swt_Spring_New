<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path}/resources/css/board.css?v=1"> 
<meta charset="UTF-8">
<title>장바구니</title>
<style type="text/css">
#cartContentWrapper {
	position: relative;
    background-color: white;
    margin: 0 auto;
    max-width: 80%;
    min-height: 100%;
    justify-content: center;
    align-items: center;
    border-left: 3px double #dee2e6;
    border-right: 3px double #dee2e6;
}
body{
	background-color: #fafafa;
}
.section_box {
	width: 100%;
	min-width: 1350px;
}
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
.container_all {
	display: flex;
}
.product_box{
	margin:25px auto;
	width: 50%;
	padding: 20px;
	border-radius: 5px;
	background: white;
	display: flex;
	box-sizing: border-box;
	position: relative;
	min-width: 700px;
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
	width: 130px;
}
.paytext_top {
	margin-top: 3px;
}
.paytext_price{
	font-size: 20px;
	flex:1;
}
.delete_btn {
	display: block;
	width: 110px;
	text-align: center;
	padding: 5px 7px;
	font-size: 13px;
	box-sizing: border-box;
	border: 1px solid #ddd;
	color: #999;
	margin-top: 10px;
	transition: .2s;
}
.delete_btn:hover {
	color: #a03758;
    border: 1px solid #a03758;
}

.pay_container {
	margin: 25px 0px 25px 40px;
	width: 400px;
}
.pay_box{
    border: 3px double #dadada;
    background-color: #f8f9fa;
    padding: 20px;
	width: 100%;
}
.price_title_box{
	padding-bottom: 8px;
	border-bottom: 1px solid #dadada;
}
.price_title{
	font-size: 28px;
}
.price_num{
	float: right;
	font-size: 28px;
}
.pay_info_box{
	padding: 8px;
}
.pay_info_title {
	font-size: 15px;
	padding-bottom: 5px;
}
.input_box{
	width: 100%;
	height: 40px;
	border: 1px solid #dadada;
    outline: none;
    font-size: 19px;
    padding: 0px 8px;
}
.pay_check{
	font-size: 14px;
	display: flex;
	padding: 9px 0px 12px;
	margin-top: 5px;
	align-items: center;
	position: relative;
}
.pay_btn{
	height: 50px;
	width: 100%;
	background: #269497;
	font-size: 22px;
	color: white;
	text-align: center;
	cursor: pointer;
	overflow: hidden;
	padding: 7px;
	position: relative;
	transition: .2s;
}
.pay_btn:before {
	content: '';
	position: absolute;
	top: 0px;
	left: 0px;
	right: 0px;
	bottom: 0px;
	z-index: -5;
	background-color: #E4E4E1;
 	background-image: linear-gradient(-225deg, #5271C4 0%, #B19FFF 48%, #ECA1FE 100%);
	background-size: 500%;
	transition: 0.2s;
}
.pay_btn:hover:before {
	z-index: 1;
	animation: animate 10s linear infinite;
}
.pay_btn_text {
	position: relative;
	z-index: 5;
}
.pay_view{
	color:blue;
	cursor: pointer;
}
#check_icon {
	position: absolute;
	font-size: 19px;
	color: #dadada;
	top: 9.5px;
	left: 0;
}
.check_text {
	padding-left: 24px;
}
#onecheck {
	display: none;
}
.err_msg {
	color: tomato;
	text-align: center;
	padding: 0px 0px 16px;
	display: none;
}
.product_flex {
	display: flex;
	align-items: center;
}
.product_check {
	width: 20px;
	height: 20px;
	margin-right: 20px;
}
#productName {
	font-size: 1.5rem;
}
.modiAmount {
	text-align: center;
    padding: 5px 7px;
    font-size: 13px;
    box-sizing: border-box;
    border: 1px solid #ddd;
    color: whitesmoke;
    margin-top: 10px;
    transition: .2s;
    background: #d75e15;
}
.pdAmount {
	width: 1.5rem;
}
</style>
</head>
<body>
	<div id="cartContentWrapper" class="content01 container">
		<div id="contentWrap">
			<div>
				<div class="section_box">
					<div class="info_title">장바구니
			        	<div class="info_title_bar"><i class="fas fa-shopping-cart"></i></div>
			        </div>
			        <div id="cartList"></div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
	<script type="text/javascript">
		$(document).ready(function(){
			cartList();
		});
		
		function cartList(){
			$.ajax({
				type: "GET",
				url: "${path}/product/cartList",
				success: function(result){
					$("#cartList").html(result);
				}, error: function(){
					alert("cartList error!!");
				}
			});
		}
		
		$(document).on("click", ".delete_btn", function(){
			var index = $(this).attr("data-index");
			$.ajax({
				type: "GET",
				url: "${path}/product/cartDelete?index="+index,
				success: function(){
					alert("장바구니에서 삭제되었습니다.");
					cartList();
				}, error: function(){
					alert("cartDelete error!!");
				}
			});
		});
		
		function cartUpdate(index) {
			var i = index;
			var amount = $.trim($(".modiAmount").eq(i).prev().val());
			var cart_id = $(".modiAmount").attr("data-modiID");
			alert(i+","cart_id+","+amount);
			var regEmpty = /\s/g; // 공백 문자 
			
 			if(isNaN(amount)==true){
 				alert("수량은 숫자만 입력해주세요.");
				return false;
			} else if(amount.match(regEmpty)){
				alert("수량은 반드시 입력해주세요.");
				return false;
			} else {
				$.ajax({
					type: "get",
					url: "${path}/product/cartUpdate?amount="+amount+"&cart_id="+cart_id,
					success: function(){
						cartList();
					}, error: function(){
						alert("수량 변경 실패");
					}
				});
			}
		}
	</script>
</body>
</html>
