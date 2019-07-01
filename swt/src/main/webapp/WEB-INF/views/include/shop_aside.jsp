<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
.aside {
    width: 260px;
    float: left;
    margin-right: 40px;
    position: absolute;
}
.aside .title_wrap {
    width: 260px;
    height: auto;
    display: table;
    text-align: center;
}
.aside .title_wrap .title {
	display: table-cell;
    vertical-align: top;
    font-size: 22px;
    color: black;
    text-align: left;
    padding: 10px;
    border-bottom: 1px solid #dcdcdc;
    padding-left: 15px;
    font-weight: bold;
    border: 4px double black;
}

.aside ul li {
    border-bottom: 1px solid #e8e8e8;
}

.aside ul li a {
    line-height: 45px;
    display: block;
    padding-left: 20px;
}

.search_box {
	position: absolute;
	right: 15px;
	bottom: -3rem;
	display: flex;
	justify-content: center;
}
.search_select {
	height: 32px;
	width: 102px;
	font-size: 15px;
	padding: 0px 0px 2px 5px;
	border-radius: 16px;
	margin-right: 8px;
	border: 1px solid #dadada;
	outline: none;
}
.search_input {
    position: relative;
    width: 230px;
    height: 32px;
    border: 1px solid #dadada;
    border-radius: 1rem;
    padding: 0px 35px 1px 10px;
    font-size: 15px;
    background: #9597b9;
    color: white;
    outline: none;
}
#pd_search_icon {
	position: absolute;
	right: 9px;
	top: 3px;
	padding: 3px;
	color: #dadada;
	font-size: 17px;
	transition: .2s;
}
.search_icon:hover {
	color: #FFC000;
}

.aside ul li a:hover {
    font-weight: bold;
    background: #e9ecef;
}
</style>
<body>
	<div class="aside">
		<div class="title_wrap">
			<p class="title">
			Tea Shop
			</p>
		</div>
		<ul>
			<li>
				<a href="#">Tea</a>
			</li>
			<li>
				<a href="#">Latte</a>
			</li>
			<li>
				<a href="#">Tea Sachet</a>
			</li>
		</ul>
		<div class="search_box">
 			<span class="search_text">
	   			<input type="search" placeholder="상품명을 입력해주세요." class="search_input">
	   			<a class="search_icon_btn">
	   				<i class="fas fa-search" id="pd_search_icon"></i>
	   			</a>
   			</span>
   		</div>
	</div>
	
</body>
</html>