<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/common.jsp" %>
<%
	String message = request.getParameter("message");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${path}/resources/css/board.css?v=1"> 
<title>QnA</title>
</head>
<body>
	<section>
		<div id="contentWrapper" class="content01 container">
			<div id="contentWrap">
				<%@ include file="../include/board_aside.jsp" %>
				<div id="content">
					<div>
						<div class="page_body">
							<div class="bd_hd">
								<div class="bd_tit01">
									<img alt="제목" src="${path}/resources/images/ribon2.png" id="ribon">
									<div id="order_board">
										<input type="hidden" value="new" id="code">
										<span>
											<a href="${path}/board/list?sort_option=new&search_option=${map.search_option}&keyword=${map.keyword}" id="orderNew">최신순</a>
										</span>
										<span>
											<a href="${path}/board/list?sort_option=good&search_option=${map.search_option}&keyword=${map.keyword}" id="orderGood">추천순</a>
										</span>
										<span>
											<a href="${path}/board/list?sort_option=reply&search_option=${map.search_option}&keyword=${map.keyword}" id="orderReply">댓글순</a>
										</span>
										<span>
											<a href="${path}/board/list?sort_option=view&search_option=${map.search_option}&keyword=${map.keyword}" id="orderCnt">조회순</a>
										</span>
									</div>
									<a href="#">
										<img id="btn_regi" alt="게시글 등록" src="${path}/resources/images/regi.png">
									</a>
								</div>
								
								<div class="box-body">
									<table class="table table-boarded" summary="No., Title, Name, Date, Likes, Hits, attachments">
										<caption>QnA 게시글</caption>
										<thead>
											<tr style="width: 10px">
												<th style="width: 50px">
													<div class="tb_center">No.</div>
												</th>
												<th style="width: 300px">
													<div class="tb_center">제목</div>
												</th>
												<th style="width: 100px">
													<div class="tb_center">작성자</div>
												</th>
												<th style="width: 130px">
													<div class="tb_center">작성일</div>
												</th>
												<th style="width: 85px">
													<div class="tb_center">좋아요</div>
												</th>
												<th style="width: 85px">
													<div class="tb_center">조회수</div>
												</th>
												<th style="width: 70px">
													<div class="tb_center">첨부</div>
												</th>
											</tr>
										</thead>
										<!-- 공지사항 리스트 끝 -->
										
										<tbody>							
																
											<!-- 게시글 리스트 시작(한페이지당 게시글 수)-->
										<c:forEach items="${map.list}" var="bDto">
											<!-- 현재시간 구하기  -->
											<jsp:useBean id="now" class="java.util.Date"/>
											<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
											<fmt:formatDate value="${bDto.regdate}" pattern="yyyy-MM-dd" var="regdate"/>
											<tr>
												<td class="text_center">
													<!-- No. -->
													<div class="tb_center">${bDto.bno}</div>
												</td>
												<td>
													<!-- 제목 -->
													<div class="title_table">
														<a href="${path}/board/view?bno=${bDto.bno}"><span id="pen">${bDto.title}</span></a>
														<c:if test="${bDto.replycnt >0}">
															<span class="replyCnt_Color">${bDto.replycnt}</span>
														</c:if>
														
														<c:if test="${today==regdate}">
														
															<span class="new_time">New</span>
														</c:if>
													</div>
												</td>
												<td>
													<!-- 작성자 -->
													<div >
														${bDto.writer}
													</div>
												</td>
												<td>
													<!-- 작성일 -->
													<div class="text_center">
													<c:choose>
														<c:when test="${today==regdate}">
															<fmt:formatDate pattern="hh:mm:ss" value="${bDto.regdate}"/>
														</c:when>
														<c:otherwise>
															<fmt:formatDate pattern="yyyy.MM.dd" value="${bDto.regdate}"/>
														</c:otherwise>
													</c:choose>
													
													<!-- 년월일 시분초까지 띄우고 싶으면=> pattern="yyyy-MM-dd hh:mm:ss" -->
													</div>
												</td>
												<td>
													<!-- 좋아요 -->
													<div class="text_center">
														<img class="btn_img btn_good" alt="좋아요" src="${path}/resources/images/good.png">
														<span class="good_cnt">
															${bDto.goodcnt}
														</span>
													</div>
												</td>
												<td>
													<!-- 조회수 -->
													
													<div class="text_center">
														<img class="btn_img btn_hits" alt="조회수" src="${path}/resources/images/hits.png">
														<span>${bDto.viewcnt}</span>
													</div>
												</td>
												<td>
													<!-- 첨부-->
													<div class="text_center">
														
													</div>
												</td>
											</tr>
										</c:forEach>
											
											
										</tbody>
									</table>
									
									<!-- 검색창 -->
									
									<div class="div_search">
										<select id="selsearch" name="selsearch">
											<option value="all" selected="selected">제목+내용</option>
											<option value="title">제목</option>
											<option value="content">내용</option>
											<option value="writer">작성자</option>
										</select>
										<input type="text" placeholder="검색할 값을 입력하세요" id="search_board" name="search_board">
										<a href="#" id="search_btn"><img alt="검색" src="${path}/resources/images/search2.png"></a>
									</div>
									
									<c:if test="${!empty map.keyword}">
										<div id="search_result">
											<span class="search_span">"${map.keyword}"</span>로 검색한 결과는 총
											<span class="search_span">${map.count}</span>건 입니다.  
										</div>
									</c:if>
									
									<!-- 페이지네이션 -->
									<div class="board_pagination">
										<ul class="pagination">
										
											<c:if test="${map.pager.curBlock > 1}">
												<li class="active">
													<a href="${path}/board/list?curPage=${map.pager.blockBegin-10}&sort_option=${map.sort_option}&search_option=${map.search_option}&keyword=${map.keyword}">
														<i class="fas fa-angle-double-left"></i>
													</a>
												</li>
												<!-- <li class="active">
													<a href="#">
														<i class="fas fa-angle-left"></i>
													</a>
												</li> -->
												
												<li>
													<a href="${path}/board/list?curPage=1&sort_option=${map.sort_option}&search_option=${map.search_option}&keyword=${map.keyword}">1</a>
												</li>
												<li>
													<a href="">...</a>
												</li>
											</c:if>
											<!-- begin end로 몇번부터 몇번까지 반복하게 설정. startPage(1)부터 begin해서 endPage(10)에서 end. var="idx"는 for문의 i(index) 같은거
											c:out은 출력임. 삼항연산자 사용. pageMaker.criDto.page : 선택한 페이지 == idx랑 같으면 class="active"효과를 주는 거 -->
											<c:forEach begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}" var="idx">
												<li <c:out value="${map.pager.curPage == idx ? 'class=active':''}"/>>
													<a href="${path}/board/list?curPage=${idx}&sort_option=${map.sort_option}&search_option=${map.search_option}&keyword=${map.keyword}">${idx}</a>
												</li>
											</c:forEach>
											
											<c:if test="${map.pager.curBlock < map.pager.totBlock}">
												<li class="active">
													<a href="">...</a>
												</li>
												
												<li>
													<a href="${path}/board/list?curPage=${map.pager.totPage}&sort_option=${map.sort_option}&search_option=${map.search_option}&keyword=${map.keyword}">
														${map.pager.totPage}
													</a>
												</li>
												
												<li class="active">
													<a href="${path}/board/list?curPage=${map.pager.blockEnd+1}&sort_option=${map.sort_option}&search_option=${map.search_option}&keyword=${map.keyword}">
														<!-- &raquo; --> 
														<i class="fas fa-angle-double-right"></i>
													</a>
												</li>
											</c:if>
										</ul>
									</div>
								</div>
							</div>
							
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</section>
	<%@ include file="../include/footer.jsp" %>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var sort_option = "${map.sort_option}";
			if(sort_option == "new"){
				$("#orderNew").css("color","rgb(36, 195, 182)").css("font-weight", "bold").css("text-decoration", "underline");
			} else if(sort_option == "good"){
				$("#orderGood").css("color","rgb(36, 195, 182)").css("font-weight", "bold").css("text-decoration", "underline");
			} else if(sort_option == "reply"){
				$("#orderReply").css("color","rgb(36, 195, 182)").css("font-weight", "bold").css("text-decoration", "underline");
			} else if(sort_option == "view"){
				$("#orderCnt").css("color","rgb(36, 195, 182)").css("font-weight", "bold").css("text-decoration", "underline");
			}
			
			// 앞에 $(document)라고 시작안하면 안에 들어있음 
			$("#btn_regi").on("click",function(){
				location.href="${path}/board/create";
				// ${path} == context root == swt
				
			});
			
			
		});
		
		$(document).on("click","#search_btn", function(){
			var search_option = $('#selsearch').val();
			var keyword = $.trim($('#search_board').val());
			
			if(keyword == null || keyword.length == 0){
				$('#search_board').focus();
				$('#search_board').css('border','1px solid rgb(183,46,154)');
				return false;
				
			}
//			alert(search_option+","+keyword);
			location.href="${path}/board/list?search_option="+search_option+"&keyword="+keyword;
		});
		
	
	
	
	</script>
	
</body>
</html>