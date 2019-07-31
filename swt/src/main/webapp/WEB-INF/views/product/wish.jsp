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
body{
	background-color: #fafafa;
}
.section_box {
	width: 100%;
	min-width: 1350px;
	padding: 150px 0px;
}
.info_title {
	width: 1350px;
    font-size: 35px;
    margin: 0px auto;
    padding: 0px 50px 30px;
    position: relative;
    box-sizing: border-box;
}
.info_title_bar {
	position: absolute;
	width: 7px;
	height: 32px;
	background-color: #444;
	top: 11.5px;
	left: 30px;
}
.lecture_box{
	margin:25px auto;
	width: 50%;
	padding: 20px;
	border-radius: 5px;
	background: white;
	display: flex;
	box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.15);
	box-sizing: border-box;
	position: relative;
	min-width: 870px;
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
.lecture_img_box{
	width: 200px;
	height: 128.9px;
	overflow: hidden;
}
.lecture_img{
	width: 100%;
	height: 100%;
}
.lecture_text{
	margin: 3px 0px 3px 30px;
	width: 455px;
	height: 100%;
	box-sizing: border-box;
}
.lecture_title {
	font-size: 20px;
	font-weight: bold;
}
.lecture_bottom {
	position: absolute;
	width: 455px;
	bottom: 25px;
	padding-top: 11px;
	border-top: 1px solid #dadada;
}
.lecture_paytext{
	position: absolute;
	right: 28px;
	top: 21px;
	width: 130px;
}
.paytext_top {
	text-align: right;
}
.paytext_price{
	text-align: right;
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
	border-radius: 15px;
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
	border-radius: 15px;
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
	color: #79CDCF;
	border: 1px solid #79CDCF;
}
.wish_btn:hover {
	color: #FFC000;
	border: 1px solid #FFC000;
}
.noempty_btn:hover {
	color: #FFC000;
	border: 1px solid #FFC000;
}
</style>
</head>
<body>
	<div id="contentWrapper" class="content01 container">
		<div id="contentWrap">
			<div id="content">
				<!-- 가장 큰 박스 -->
				<div class="section_box">
					<div class="lecture_container">
						<div class="info_title">위시리스트
				        	<div class="info_title_bar"></div>
				        </div>
				        <div id="wishlist"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
	<script type="text/javascript">
	
	</script>
</body>
</html>
