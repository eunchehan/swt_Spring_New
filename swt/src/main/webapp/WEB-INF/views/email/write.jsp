<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/board.css?v=1"> 
<title>Insert title here</title>
<style type="text/css">
#mail-submit-btn {
	float: right;
    margin-right: 4rem;
    margin-top: 1rem;
    border: 3px double #eee;
    background: #252851;
    color: white;
}
.input-border {
    border: 3px double #dadada;
    outline: none;
    margin-bottom: 0.5rem;
}
#receiveUser {
    color: #dadada;
    font-weight: lighter;
    background: beige;
}
.mail-write-title {
    border-bottom: 3px solid #252851;
    padding: 1rem;
    margin-bottom: 1.5rem;
    color: #252851;
    letter-spacing: -1;
}
</style>
</head>
<body>
	<div id="contentWrapper" class="content01 container">
		<div id="contentWrap">
			<%@ include file="../include/board_aside.jsp" %>
			<div id="content">
				<h2 class="mail-write-title">1:1 문의</h2>
				<form method="POST" action="${path}/email/send">
					<input name="senderName" class="input-border" placeholder="보낸이"><br>
					<input id="senderMail" name="senderMail" placeholder="example@mail.com 형식" class="input-border"><br>
					<input name="receiveMail" value="euntestmail@gmail.com" readonly="readonly" class="input-border" id="receiveUser"><br>
					<input name="subject" class="input-border" placeholder="제목"><br>
					<textarea rows="5" cols="80" name="message"  id="message" class="input-border" placeholder="문의 내용"></textarea><br>
					<input type="submit" id="mail-submit-btn" value="전송">
				</form>
				<span style="color:#b30000; letter-spacing: -1; font-size: 0.85rem; margin-left: 0.3rem;">${message}</span>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
	</script>
</body>
</html>