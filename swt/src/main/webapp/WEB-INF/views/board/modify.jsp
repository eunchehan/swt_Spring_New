<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/common.jsp" %>
<c:if test="${sessionScope.loginUser == null}">
	<script>
		alert("로그인 하신 후 사용하세요.");
		location.href="${path}/boardList.swt?message=nologin";
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${path}/css/board_regi.css?v=1">
<title>게시글 수정</title>
<script type="text/javascript" src="${path}/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>
	<section>
		<div id="contentWrapper" class="content01">
		<%@ include file="../include/board_aside.jsp" %>
			<div id="content">
				<div>
					<div class="page_body">
						<div class="bd_hd">
							<div class="bd_tit01">
								<img alt="제목" src="${path}/images/ribon2.png" id="ribon">
							</div>
							<form class="modify_form" id="modify_frm" method="POST" action="modifyPlay.swt" enctype="multipart/form-data">
								<div class="box-body">
									<table class="table-boarded">
										<caption>QnA 게시글</caption>
										<thead>
											<tr>
												<th>
													<div class="tb-left">제목</div>
													<fieldset class="fform">
														<input name="modi_title" class="form-control" id="modi_title" value="${one.title}">
															<span class="step_url"></span>
															
													</fieldset>
												</th>
											</tr>
											
										</thead>
										<tbody>
											
											<tr>
												<td>
													<div class="data-bd-cont">
														<span class="detail_wr">
															<div class="tb-left">내용</div>
															<fieldset class="fform">
																	<textarea rows="1" cols="1" placeholder="내용" class="form-control" id="boardListModify" name="boardListModify" style='width:100%; min-width:260px;'><el>${one.content}</el></textarea>
																	<script type="text/javascript">
																		var oEditors = [];
																		nhn.husky.EZCreator.createInIFrame({
																		 oAppRef: oEditors,
																		 elPlaceHolder: "boardListModify",
																		 sSkinURI: "<%=request.getContextPath()%>/smarteditor/SmartEditor2Skin.html",
																		 fCreator: "createSEditor2"
																		});
																	</script>
																	<span class="step_url"></span>
															</fieldset>
														</span>
													</div>
												</td>
											</tr>
											
										</tbody>
										<tfoot>
											<tr>
												<td>
													<div class="tb-left">작성자</div>
													<fieldset class="fform">
														<input class="form-control" name="modi_writer" id="modi_writer" value="${sessionScope.loginUser.id}" readonly="readonly">
														
													</fieldset>
												</td>
											</tr>
										</tfoot>
									</table>
									
									<div class="btn_area">
										</div>
										<div class="btn_right">
											<a>
												<c:if test="${sessionScope.loginUser.id == one.writer}">
													
													<img class="bd-btns" id="btn_modi" alt="게시글 수정" src="${path}/images/regi.png">
												
												</c:if>
											</a>
										</div>
										
									</div>
								</div>
								<input type="hidden" id="basic_check" name="basic_check">
								<input type="hidden" name="hidden_bno" id="hidden_bno" value="${one.bno}">
							
							
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="../include/footer.jsp" %>
	<script type="text/javascript">
		$(document).ready(function(){
			
		
		
			$("#btn_modi").click(function(){
				
				oEditors.getById["boardListModify"].exec("UPDATE_CONTENTS_FIELD",[]); //이걸해야 스마트에디터에서 값 가져옴 
				// 첨부파일 제외하고 게시글 등록되게 하기
				var title = $("#modi_title").val();
				var content = $("#boardListModify").val();
						
				// 게시글 내용 작성자 null안되게 유효성 체크
				if(title==""||title.length==0){
					$('.step_url').text('글을 등록하려면 입력해주세요').css('display','block');
					return false;
				} else {
					$('.step_url').css('display','hidden');
				} 
				
				if(content == "<p><br></p>"){
					$('.step_url').text('글을 등록하려면 입력해주세요').css('display','block');
					return false;
				} else {
					$('.step_url').css('display','hidden');
				} 
				
				$("#modify_frm").submit();
			});
		
	       
	      
		});
		
	</script>
</body>
</html>