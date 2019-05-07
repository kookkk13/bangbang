<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<c:import url="../common/header.jsp"/>
	</head>
	<script type="text/javascript">
		function check(){
			if(document.search.keyWord.value == ""){
				alert("검색어를 입력하세요.");
				document.search.keyWord.focus();
				return;
			}
			document.search.submit();
		}
	</script>
	<body>
		<div id="admin-header">
			<a href="/bangbang"><h1><strong>BANG BANG</strong></h1></a>
		</div>
		
		<div id="bangData" class="container">
			<div class="topTabBox">
				<ul>	
					<li><a href="adminUserList.do"><span>회원 관리</span></a></li>
					<li><a href="adminComList.do"><span>업체 관리</span></a></li>
					<li><a href="adminblist.do"><span>방 매물 관리</span></a></li>
					<li><a href="adminNlist.do"><span>공지 관리</span></a></li>
					<li class="on"><a href="adminQNAlist.do"><span>Q&A 관리</span></a></li>
				</ul>
			</div>
			<div class="searchWrap">
				<div class="searchBox">
					<form action="adminQNASearch.do" name="search" method="post">
					<div class="select_box">
						<select name="keyField" size="1">
							<option value="qna_title" <c:if test="${'qna_title' == keyField}"> selected </c:if>>제목</option>
							<option value="user_id" <c:if test="${'user_id' == keyField}"> selected </c:if>>아이디</option>
						</select>
					</div>
					<input type="text" name="keyWord" value="${keyWord }"/>
					<a class="btnSearch" onclick="check();"><span>검색</span></a>
					</form>
				</div>
			</div>
			<div class="litCdBox">
				<dl>
					<dd class="litCd_2 left">
						<strong class="infoTit">Q&A 관리</strong>
					</dd>
					<div class="clr"></div>
				</dl>
			</div>
			<table class="tableConWrap">
				<thead>
					<!-- 
						이걸 보면 매우 놀라겠지. width값이 다 정해져 있어서.
						하지만 놀랄 필욘 없어 사용법만 알면 자유자재로 사용할 수 있다구. 사용법을 알려주겠어.
						우선 체크 박스 3% 를 제외하고 나머지 97% 안에서 원하는 것을 계산하여 넣으면 돼(체크박스는 항상 빼고 계산해줭)
						예를들어 th가 체크박스를 포함하여 5개 필요하다고 하면
						나머지 4개가 97%를 나눠 쓰면 되는거지!
						그래서 3개는 25% 쓰고 나머지 한개는 23%를 쓰면 100%가 되는고얌. width값 나누는건 어렵지 않지?
						그렇다면 여기서 의문이 들겠지. 대체 왜이렇게 복잡하게 쓰느냐
						그건.테이블 width가 100%이여서 그렇다고 대답해 줄 수 있어.
						그럼 좋은 기능구현 시간이 되길 발애
						추가로 질문이 있다면 카톡으로 물어보라구 찡-긋
					-->
					
					<th style="width:4%;">Q&A번호</th>
					<th style="width:6%;">회원아이디</th>
					<th style="width:13%;">제목</th>
					<th style="width:35%;">문의글</th>
					<th style="width:35%;">답변</th>
					<th style="width:7%;" class="tModify">관리</th>
				</thead>
				<tbody>
					<c:forEach items="${qnaList }" var="qna">
					<tr>
						<td>
							<p>${qna.qna_no }</p>
						</td>
						<td>
							<p>${qna.user_id }</p>
						</td>
						<td>
							<p>${qna.qna_title }</p>
						</td>
						<td>
							<p>${qna.qna_content }</p>
						</td>
						<td>
							<p>${qna.qna_answer }</p>
						</td>
						<td class="tModify">
						 <c:url var="qnaadminview" value="qnaanswerview.do">
							<c:param name="qna_no" value="${qna.qna_no }" />
							<c:param name="user_id" value="${qna.user_id }"/>
						 </c:url>
						 <c:url var="qnaadmindelete" value="qnaadmindelete.do">
							<c:param name="qna_no" value="${qna.qna_no }" />
							<c:param name="user_id" value="${qna.user_id }"/>
						 </c:url>
	                        <a href="${qnaadminview }" class="btnModify">수정</a>
	                        <a href="${qnaadmindelete }" class="btnDelete">삭제</a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${empty qnaList }">
				<div align="center">검색결과가 없습니다.</div>
			</c:if>
			
			<c:if test="${!empty keyWord}">
			<div class="paging">
	                	<c:url var="first" value="adminQNASearch.do">
	                	<c:param name="keyField" value="${keyField }" />
	                    <c:param name="keyWord" value="${keyWord }" />
	                	<c:param name="page" value="1"/>
	                	</c:url>
	              		<a href="${first }" class="first arrow"></a>
	                    <c:url var="prev" value="adminQNASearch.do">
	                    	<c:param name="keyField" value="${keyField }" />
	                     	<c:param name="keyWord" value="${keyWord }" />
	                		<c:param name="page" value="${ currentPage - 1 }"/>
	                	</c:url>
	                    <a href="${prev }" class="prev arrow"></a>
	                    <c:forEach var="p" begin="${startPage }" end="${endPage }" step="1">
	                     <c:url var="move" value="adminQNASearch.do">
	                     	<c:param name="keyField" value="${keyField }" />
	                     	<c:param name="keyWord" value="${keyWord }" />
	                		<c:param name="page" value="${ p}"/>
	                	</c:url>
	                    <c:if test="${p eq currentPage }">
	                    	<a>${p }</a>
	                    </c:if>
	                    <c:if test="${p ne currentPage }">
	                    	<a href="${move }">${p }</a>
	                    </c:if>
	                    </c:forEach>
	                     <c:url var="next" value="adminQNASearch.do">
	                     <c:param name="keyField" value="${keyField }" />
	                     	<c:param name="keyWord" value="${keyWord }" />
	                		<c:param name="page" value="${ currentPage + 1 }"/>
	                	</c:url>
	                	<a href="${next }" class="next arrow"></a>
	                    <c:url var="last" value="adminQNASearch.do">
	                    	<c:param name="keyField" value="${keyField }" />
	                     	<c:param name="keyWord" value="${keyWord }" />
	                		<c:param name="page" value="${ maxPage}"/>
	                	</c:url>
	                    <a href="${last }" class="last arrow"></a>
	              </div>
	                </c:if>
	                <c:if test="${empty keyWord}">
	                	<div class="paging">
	                	<c:url var="first" value="adminQNAlist.do">
	                	<c:param name="page" value="1"/>
	                	</c:url>
	              		<a href="${first }" class="first arrow"></a>
	                    <c:url var="prev" value="adminQNAlist.do">
	                		<c:param name="page" value="${ currentPage - 1 }"/>
	                	</c:url>
	                    <a href="${prev }" class="prev arrow"></a>
	                    <c:forEach var="p" begin="${startPage }" end="${endPage }" step="1">
	                     <c:url var="move" value="adminQNAlist.do">
	                		<c:param name="page" value="${ p}"/>
	                	</c:url>
	                    <c:if test="${p eq currentPage }">
	                    	<a>${p }</a>
	                    </c:if>
	                    <c:if test="${p ne currentPage }">
	                    	<a href="${move }">${p }</a>
	                    </c:if>
	                    </c:forEach>
	                     <c:url var="next" value="adminQNAlist.do">
	                		<c:param name="page" value="${ currentPage + 1 }"/>
	                	</c:url>
	                	<a href="${next }" class="next arrow"></a>
	                    <c:url var="last" value="adminQNAlist.do">
	                		<c:param name="page" value="${ maxPage}"/>
	                	</c:url>
	                    <a href="${last }" class="last arrow"></a>
	                </div>
	                </c:if>
		</div>
	</body>
</html>