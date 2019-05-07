<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<c:import url="../common/header.jsp"/>
		<script type="text/javascript">
			$(function(){
				// 게시판 액션
				$('.comuLit').mouseover(function(){
					$(this).addClass('hover');
					$('.arrow').addClass('hover');
				});
				$('.comuLit').mouseout(function(){
					$(this).removeClass('hover');
					$('.arrow').removeClass('hover');
				});
				$('.comuLit .titBox').click(function(){
					$(this).parents('.comuLit').removeClass('hover');
					$(this).closest('.comuLitWrap').find('.comuLit').removeClass('open');
					$('.contentBox').slideUp(300);
					if(!$(this).siblings('.contentBox').is(':visible')){
						$(this).siblings('.contentBox').slideDown(300);
						$(this).parent('.comuLit').addClass('open');	
					}
				});
			});
		</script>
	</head>
	<body>
		<c:import url="../common/top.jsp"/>
		
		<div id="qna-index">
			<div class="comuArea qnaArea">
				<div class="comuWrap qnaWrap">
					<div class="comuTitBox">
						<strong>Q&A</strong>
						<c:if test="${  sessionScope.loginMember.id ne 'admin'}">
	                  		<a href="qnawrite.do" class="btnWrite"><span>질문 작성하기</span></a>
	                  	</c:if>
						<div class="clr"></div>
					</div>
	                <div class="writeArea" style="display:none;"></div>
	                <div class="comuLitWrap qnaLitWrap">
	                    <ul>
	                    	<c:if test="${listCount != 0 }">
	                    	<c:forEach items="${qnaList }" var="qna">
	                        <li class="comuLit">
	                            <a href="javascript:void(0);" class="titBox">
	                                <span class="arrow"></span>
	                                <c:if test="${!empty qna.qna_answer }">
	                                <span class="tit"><span class="titLabel a-on">답변완료</span>${qna.qna_title }</span>
	                                </c:if>
	                                <c:if test="${empty qna.qna_answer }">
	                                <span class="tit"><span class="titLabel a-on">미답변</span>${qna.qna_title }</span>
	                                </c:if>
	                                <span class="date">${qna.qna_date }</span>
	                            </a>
	                            <div class="contentBox" style="display:none;">
	                                <div class="txtBox qnaBox qBox">
	                                	${qna.qna_content }
	                                    <div class="comuModifyWrap">
	                                        <div class="btnCtrl">
	                                         <c:url var="qnaupdateview" value="qnaupdateview.do">
												<c:param name="qna_no" value="${qna.qna_no }" />
												<c:param name="user_id" value="${qna.user_id }"/>
											</c:url>
											 <c:url var="qnadelete" value="qnadelete.do">
												<c:param name="qna_no" value="${qna.qna_no }" />
												<c:param name="id" value="${qna.user_id }"/>
											</c:url>
	                                          <a href="${qnaupdateview }" class="btnModify"><span>수정</span></a>
	                                          <a href="${qnadelete }" class="btnDelete"><span>삭제</span></a>
	                                        </div>
	                                    </div>
	                                </div>
	                                <c:if test="${!empty qna.qna_answer }">
	                                <div class="txtBox qnaBox aBox">
	                                	${qna.qna_answer }
	                                </div>
	                                </c:if>
	                              </div>
	                              </li>
	                             </c:forEach> 
	                            </c:if>
	                             <c:if test="${listCount == 0 }">
	                              	<div align="center"><h4>등록한 문의글이 없습니다.</h4></div>
	                              </c:if>  
	                             
	                    </ul>
	                </div>
	                <div class="pagination">
	                	<div class="page-con">
	                	<c:url var="first" value="qnalist.do">
	                		<c:param name="page" value="1"/>
	                		<c:param name="id" value="${loginMember.id }" />
	                	</c:url>
	              		<a href="${first }" class="btn-arrow btn-first"><span>맨처음</span></a>
	                    <c:url var="prev" value="qnalist.do">
	                		<c:param name="page" value="${ currentPage - 1 }"/>
	                		<c:param name="id" value="${loginMember.id }" />
	                	</c:url>
	                    <a href="${prev }" class="btn-arrow btn-prev"><span>이전</span></a>
	                    <c:forEach var="p" begin="${startPage }" end="${endPage }" step="1">
	                     <c:url var="move" value="qnalist.do">
	                		<c:param name="page" value="${ p}"/>
	                		<c:param name="id" value="${loginMember.id }" />
	                	</c:url>
	                    <c:if test="${p eq currentPage }">
	                    	<a>${p }</a>
	                    </c:if>
	                    <c:if test="${p ne currentPage }">
	                    	<a href="${move }">${p }</a>
	                    </c:if>
	                    </c:forEach>
	                     <c:url var="next" value="qnalist.do">
	                		<c:param name="page" value="${ currentPage + 1 }"/>
	                		<c:param name="id" value="${loginMember.id }" />
	                	</c:url>
	                	<a href="${next }" class="btn-arrow btn-next"><span>다음</span></a>
	                    <c:url var="last" value="qnalist.do">
	                		<c:param name="page" value="${ maxPage}"/>
	                		<c:param name="id" value="${loginMember.id }" />
	                	</c:url>
	                    <a href="${last }" class="btn-arrow btn-last"><span>맨끝</span></a>
	                </div>
				</div>
			</div>
		</div>
		</div>
					
	</body>
</html>