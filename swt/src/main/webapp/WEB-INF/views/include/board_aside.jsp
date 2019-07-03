<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.aside {
	width: 260px;
    float: left;
    margin-right: 1rem;
    margin-left: 0.5rem;
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
    color: #adb5bd;
    text-align: left;
    padding: 10px;
    border-bottom: 1px solid #dcdcdc;
    padding-left: 15px;
    font-weight: bold;
    border: 4px double #dadada;
}

.aside ul li {
    border-bottom: 1px solid #e8e8e8;
}

.aside ul li a {
    line-height: 45px;
    display: block;
    padding-left: 20px;
    color: #adb5bd;
}

.aside ul li a:hover {
    font-weight: bold;
    background: #ebebd5;
}
</style>
</head>
<div class="aside">
	<div class="title_wrap">
		<p class="title">
		CUSTOMER<br>SERVICE
		</p>
	</div>
	<ul>
		<li>
			<a href="#">NOTICE</a>
		</li>
		<li>
			<a href="${path}/board/list">QnA</a>
		</li>
		<li>
			<a href="${path}/email/write">1:1 문의</a>
		</li>
	</ul>
</div>
</html>