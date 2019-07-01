<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${path}/resources/css/board_regi.css?v=1">
<title>게시글 등록</title>
<script type="text/javascript" src="${path}/resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
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
								<img alt="제목" src="${path}/resources/images/ribon2.png" id="ribon">
							</div>
							<form class="register_form" id="register_frm" method="POST" action="${path}/board/answer">
							<input type="hidden" value="${one.bno}" name="bno">
								<div class="box-body">
									<table class="table-boarded">
										<caption>QnA 게시글</caption>
										<thead>
											<tr>
												<th>
													<div class="tb-left">제목</div>
													<fieldset class="fform">
														<input name="title" class="form-control" id="regi_title" value="RE: ${one.title}" readonly="readonly">
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
																<input type="hidden" name="" value="HTML">
																<textarea rows="1" cols="1" class="form-control" id="boardListInsert" name="content" style='width:100%; min-width:260px;'>
																	${one.content}
																</textarea>
																<script type="text/javascript">
																	var oEditors = [];
																	nhn.husky.EZCreator.createInIFrame({
																	 oAppRef: oEditors,
																	 elPlaceHolder: "boardListInsert",
																	 sSkinURI: "${path}/resources/smarteditor/SmartEditor2Skin.html",
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
														<input class="form-control" name="writer" id="regi_writer" value="${sessionScope.userid}" readonly="readonly">
													</fieldset>
												</td>
											</tr>
										</tfoot>
									</table>
									
									<div class="btn_area">
										<div class="btn_right">
											<img class="bd-btns" id="btn_regi" alt="게시글 등록" src="${path}/resources/images/regi.png">
										</div>
									</div>
								</div>
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
			
			$("#btn_regi").click(function(){
				
				oEditors.getById["boardListInsert"].exec("UPDATE_CONTENTS_FIELD",[]); //이걸해야 스마트에디터에서 값 가져옴 
				// 첨부파일 제외하고 게시글 등록되게 하기
				var title = $("#regi_title").val();
				var content = $("#boardListInsert").val();
					
				// 게시글 내용 작성자 null안되게 유효성 체크
				if(title==""||title.length==0){
					$('.step_url').text('글을 등록하려면 입력해주세요').css('display','block');
					return false;
				} else {
					$('.step_url').css('display','hidden');
//					alert('유효성 체크1 완료');
				} 
				
				if(content == "<p><br></p>"){
					$('.step_url').text('글을 등록하려면 입력해주세요').css('display','block');
					return false;
				} else {
					$('.step_url').css('display','hidden');
//					alert('유효성 체크2 완료');
				} 
				
				$("#register_frm").submit();
			});
			
			
			
		});
		
	</script>
	
</body>
</html>