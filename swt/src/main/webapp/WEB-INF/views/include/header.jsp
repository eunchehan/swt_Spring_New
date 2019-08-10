<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
							<!-- depth가 닫라서 상위폴더로 나가서 경로 찾아가야함 -->
<link rel="stylesheet" href="${path}/resources/css/common.css?v=1"> 
<link rel="stylesheet" href="${path}/resources/css/header.css?v=1"> 
<title>SleepWellTea</title>
</head>
<body>
<!-- TOP버튼 -->
<button id="topBtn">
	<i class="fas fa-arrow-up"></i>
</button>
<header>
	<!-- 모달 로그인 시작  -->
	<div id="modal_all">
		<div id="modal">
			<div id="wrap">
				<button id="close_btn">
					<i class="fas fa-times"></i>
				</button>
				<div id="swt_content">
					<div id="login_area">
						<div id="login_logo">
							<img alt="Welcome" src="${path}/resources/images/ribon_wel.png">
						</div>
						<div id="login_modal_container">
							<form method="POST" id="login_form">
								<input type="text" class="idpw" id="login_id" name="login_id" placeholder="아이디"></input>
								<input type="password" class="idpw" id="login_pw" name="login_pw" placeholder="패스워드"></input>
							</form>

							<form>
							    <div class="custom-control custom-switch">
							      <input type="checkbox" class="custom-control-input" id="switch1" name="example">
							      <label class="custom-control-label" for="switch1">로그인 유지</label>
							      
							    </div>
							</form>
								<div>
									<button type="button" id="btn_login" class="login-btn">Login</button>
								</div>
								<span id="step_url"></span>
						
								<div id="right">
									<a href="#">아이디 찾기</a>
									<span class="right_bar">｜</span>
									<a href="#">비밀번호 재설정</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 로그인 끝  -->
	<div class="header_menu jbFixed_menu" id="header_line">
		<div class="inner_header inner_header_menu">
			<div class="header_member" id="modal_member">
				
				<ul>
				
				<c:choose>
					<c:when test="${empty sessionScope.name}">
					<li><a id="open_btn">Login</a></li>
					<li><a href="${path}/member/constract" target="_blank">Join</a></li>
					</c:when>
					<c:otherwise>
					<li id="loginInfo">
						<span>${sessionScope.name}</span>
							(${sessionScope.userid})
					</li>
					<li><a href="#" class="logout_btn">Logout</a></li>
					</c:otherwise>
				</c:choose>
					
					<li class="mydrop1">
						<a href="#">MyPage</a>
						<div id="mydrop2">
						
						<c:choose>
							<c:when test="${!empty sessionScope}">
								<a href="${path}/member/update">Account</a>
								<a href="${path}/member/pwupdate">Password</a>
								<a href="#">Order</a>
								<a href="${path}/product/wishView">WishList</a>
							</c:when>
						</c:choose>
						</div> 
					</li>
					<li><a href="${path}/product/cartView">Cart</a></li>
				
				</ul>

			</div>
		</div>
	</div>
	<div class="two_wrap">
		<div class="header_logo">
			<div class="inner_header">
				<a href="${path}/">
					<img id="logo" src="${path}/resources/images/mylogo_6.png" alt="로고이미지">
				</a>
			</div>
		</div>
		<div class="header_nav">
			<!-- <div class="inner_header_nav"> -->
			<ul>
				<li id="dropdown1">
					<a class="ihn" href="${path}/product/teashop">Tea Shop</a>
					 <div class="dropdown2">
						<a href="${path}/product/tea?p_type=TEA">Tea</a>
						<a href="#">Latte</a>
						<a href="#">Tea Sachet</a>
					</div>
				</li>
				<li><a class="ihn" href="#">Teawear</a></li>
				<li><a class="ihn" href="#">Gift Set</a></li>
				<li><a class="ihn" href="#">S.W.T</a></li>
				<li><a class="ihn" href="${path}/board/list">CS Center</a></li>
			</ul>
		</div>
	</div>
</header>

<script type="text/javascript">
	// LoginInterceptor에서 보내는 메세지 
	var message = '${message}';	// 브라우저에 뜰 때는 실제값으로 바뀌어서 들어 감 
	var uri = '${uri}';
	
	$(function(){
		if(message == "nologin"){
			$('#modal_all').css('display','flex');
			$('#step_url').text('로그인 해주세요').css('display','block');
			$('#login_id').focus();
		}
		
		$('#open_btn').click(function(){
			$('#modal_all').css('display','flex');
			$('#login_id').focus();
		});
		$('#close_btn').click(function(){
			$('#login_id').val("");
			$('#login_pw').val("");
			$('#step_url').css('display','none');
			$('#modal_all').css('display','none');
		});
		$('#btn_login').click(function(){
			var id = $.trim($('#login_id').val());
			var pw = $.trim($('#login_pw').val());
		});
		
		// top버튼 
		$(window).scroll(function(){
			var scrollValue = $(this).scrollTop();
			if(scrollValue > 50){
				$('#topBtn').fadeIn();
			} else {
				$('#topBtn').fadeOut();
			}
		});
		$('#topBtn').click(function(){
			$('html,body').animate({scrollTop:0},150);
		});
		
		var inputs = $('#searchtxt').val();
		
		/* logout버튼 누를 때 동작 */
		$(".logout_btn").click(function(){
			$.ajax({
				url: "${path}/member/logout",
				type: "POST",
				success: function() {
					location.reload();
				},
				error:function(){
					alert("System Error!!");
				}
			});
		});
		
		$('#btn_login').click(function(){
			var id = $.trim($('#login_id').val());
			var pw = $.trim($('#login_pw').val());
			
			var regEmpty = /\s/g; // 공백문자 체크
			//1. null값 체크
			//2. 공백체크 
			if(id == null || id.length == 0){
				$('#step_url').text('필수정보 입니다').css('display','block');
				return false;
			}else if(id.match(regEmpty)){
				$('#step_url').text('공백없이 입력해주세요').css('display','block');
				return false;
			}
			if(pw == null || pw.length == 0){
				$('#step_url').text('필수정보 입니다').css('display','block');
				return false;
			}else if(pw.match(regEmpty)){
				$('#step_url').text('공백없이 입력해주세요').css('display','block');
				return false;
			}
			
			$.ajax({
				url: "${path}/member/login",
				type: "POST",
				dataType: "text", // return타입 데이터 flag는 String타입, 화면단에선 text 
				data: "id="+id+"&pw="+pw,
				success: function(data) {// controller부터 쭉 타고와서 controller return으로 보내준 String flag의 값이 담김 
					if(data == "1") {
						if(uri == ''){ // interceptor 안 탄 경우
							location.reload(); // 새로고침 
						}else { // interceptor 탄 경우: 가야할 페이지가 있음
							location.href = uri;
						}
					} else if(data == "-1"){
						$('#login_id').focus();
						$('#step_url').text('회원 아이디 또는 비밀번호가 일치하지 않습니다.').css('display','block');
					}
				},
				error:function(){
					alert("System Error!!");
				}
			});
			
			
		});
		
		var jbOffset = $('.header_menu').offset();
		$(window).scroll(function(){
			if($(document).scrollTop()>0){
				$('.jbFixed_menu').css('top','0px').css('position','fixed')
								  .css('transition','0.2s');
				$('.two_wrap').css('top','-300px')
						      .css('position','fixed');
				$('#header_line').css('opacity','0.85');
			} else {
				$('.jbFixed_menu').css('top','0px')
								  .css('position','relative')
								  .css('transition','0.2s');
				$('.two_wrap').css('top','0px').css('position','relative');
				$('#header_line').css('opacity','1');
			}
		});
	
	});
	

	
	
	
	
</script>
</body>
</html>