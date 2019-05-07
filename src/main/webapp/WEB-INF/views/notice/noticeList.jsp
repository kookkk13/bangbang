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
		<div id="notice-index">
			<div class="comuArea noticeArea">
				<div class="comuWrap noticeWrap">
					<div class="comuTitBox">
						<strong>공지사항</strong>
						<div class="clr"></div>
					</div>
	                <div class="writeArea" style="display:none;"></div>
	                <div class="comuLitWrap noticeLitWrap">
	                    <ul>
	                    	<c:forEach items="${noticeList }" var="notice">
	                    	<input type="hidden" name="notice_no" value="${notice.notice_no }">
	                        <li class="comuLit">
	                            <a href="javascript:void(0);" class="titBox">
	                                <span class="arrow"></span>
	                                <span class="tit">${notice.notice_title }</span>
	                                <span class="date">${notice.notice_date }</span>
	                            </a>
	                            <div class="contentBox" style="display:none;">
	                                <div class="txtBox">
	                                	${notice.notice_content }
	                                </div>
	                            </div>
	                        </li>
	                        </c:forEach>
	                    </ul>
	                </div>
	                 <div class="pagination">
	                	<div class="page-con">
	                	<c:url var="first" value="nlist.do">
	                		<c:param name="page" value="1"/>
	                	</c:url>
	              		<a href="${first }" class="btn-arrow btn-first"><span>맨처음</span></a>
	                    <c:url var="prev" value="nlist.do">
	                		<c:param name="page" value="${ currentPage - 1 }"/>
	                	</c:url>
	                    <a href="${prev }" class="btn-arrow btn-prev"><span>이전</span></a>
	                    <c:forEach var="p" begin="${startPage }" end="${endPage }" step="1">
	                     <c:url var="move" value="nlist.do">
	                		<c:param name="page" value="${ p}"/>
	                	</c:url>
	                    <c:if test="${p eq currentPage }">
	                    	<a>${p }</a>
	                    </c:if>
	                    <c:if test="${p ne currentPage }">
	                    	<a href="${move }">${p }</a>
	                    </c:if>
	                    </c:forEach>
	                     <c:url var="next" value="nlist.do">
	                		<c:param name="page" value="${ currentPage + 1 }"/>
	                	</c:url>
	                	<a href="${next }" class="btn-arrow btn-next"><span>다음</span></a>
	                    <c:url var="last" value="nlist.do">
	                		<c:param name="page" value="${ maxPage}"/>
	                	</c:url>
	                    <a href="${last }" class="btn-arrow btn-last"><span>맨끝</span></a>
	                </div>
				</div>
			</div>
		</div>
	</body>
</html>