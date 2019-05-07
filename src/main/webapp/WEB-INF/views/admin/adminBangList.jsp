<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<c:import url="../common/header.jsp"/>
	</head>
	<body>
		<div id="admin-header">
			<a href="/bangbang"><h1><strong>BANG BANG</strong></h1></a>
		</div>
		
		<div id="bangData" class="container">
			<div class="topTabBox">
				<ul>
					<li ><a href="adminUserList.do"><span>회원 관리</span></a></li>
					<li><a href="adminComList.do"><span>업체 관리</span></a></li>
					<li class="on"><a href="adminblist.do"><span>방 매물 관리</span></a></li>
					<li><a href="adminNlist.do"><span>공지 관리</span></a></li>
					<li><a href="adminQNAlist.do"><span>Q&A 관리</span></a></li>
				</ul>
			</div>
			
			<div class="searchWrap">
				<div class="searchBox">
					<form action="adminSblist.do" method="post" id="search">
					<div class="select_box">
						<select name="searchType">
							<option value="pro_no" <c:if test="${ searchType == 'pro_no'}"> selected</c:if>>매물번호</option>
							<option value="build_type"<c:if test="${ searchType == 'build_type'}"> selected</c:if>>건물형태</option>
							<option value="id"<c:if test="${ searchType == 'id'}"> selected</c:if>>아이디</option>
						</select>
					</div>
					<div class="select_box">
					<input type="text" name="keyword" required/>
					</div>
					<a class="btnSearch" href="#" style="display:inline-block;"
						onclick="document.getElementById('search').submit();">
						<span>검색</span></a>
					<a class="btnSearch" style="display:inline-block;" href="adminblist.do"><span>전체보기</span></a>	
					</form>
				</div>
			</div>
			<div class="litCdBox">
				<dl>
					<dd class="litCd_1 left">
					</dd>
					<dd class="litCd_2 left">
						<strong class="infoTit">방 매물 관리</strong>
					</dd>
		
					<div class="clr"></div>
				</dl>
			</div>
			<table class="tableConWrap">
				<thead>
					<th style="width:7%;">매물번호</th>
					<th style="width:10%;">아이디</th>
					<th style="width:18%;">매물소재지</th>
					<th style="width:7%;">건물형태</th>
					<th style="width:7%;">계약형태</th>
					<th style="width:5%;">보기</th>
					<th style="width:7%;">매물삭제여부</th>
					<th style="width:7%;">삭제일자</th>
					<th style="width:7%;">계약상태</th>
					<th style="width:13%;" class="tModify">관리</th>
				</thead>
				<tbody>
				<c:forEach items="${blist}" var="Bang">
				<c:url var="binfo" value="binfo.do">
					<c:param name="pro_no" value="${ Bang.pro_no }" />
					<c:param name="id" value="${ Bang.id }"/>
					<c:param name="userType" value="admin"/>
				</c:url>
					<tr>
						<td>
							<p>${ Bang.pro_no }</p>
						</td>
						<td>
							<p>${ Bang.id }</p>
						</td>
						<td>
							<p>${ Bang.pro_address }</p>
						</td>
						<td>
							<p>${ Bang.build_type }</p>
						</td>
						<td>
							<p>${ Bang.con_type }</p>
						</td>
						<td class="tModify">
							<a href="${ binfo  }" target="_blank">보기</a>
						</td>
						<td>
							<p>${ Bang.pro_del }</p>
						</td>
						<td>
							<c:if test="${ Bang.pro_del eq 'Y'}">
							${ Bang.del_date }</c:if>
						</td>
						<td>
							<p>${ Bang.contract_yn }</p>
						</td>
						<td class="tModify">
						<c:url var="bupView" value="bupdateView.do">
							<c:param name="pro_no" value="${ Bang.pro_no }"/>
							<c:param name="id" value="${ Bang.id }"/>
							<c:param name="userType" value="admin"/>
						</c:url>
						<c:url var="bdel" value="adminBdel.do">
							<c:param name="pro_no" value="${ Bang.pro_no }"/>
							<c:param name="userType" value="admin"/>
						</c:url>
							<c:if test="${ Bang.pro_del eq 'N' }">
								<a href="${ bupView }">수정</a>
								<a href="${ bdel }">삭제</a>
							</c:if>
						</td>
						
					</tr>
				</c:forEach>
				</tbody>
			</table>
				<c:if test="${empty blist }">
				<div align="center"><br>검색된 매물정보가 존재하지 않습니다.</div>
			</c:if>
				<c:if test="${!empty searchType}">
					<div class="paging">
	                	<c:url var="first" value="adminSblist.do">
	                	<c:param name="searchType" value="${ searchType }" />
	                    <c:param name="keyword" value="${ keyword }" />
	                	<c:param name="page" value="1"/>
	                	</c:url>
	              		<a href="${first }" class="first arrow"></a>
	                    <c:url var="prev" value="adminSblist.do">
	                    	<c:param name="searchType" value="${ searchType }" />
	                     	<c:param name="keyword" value="${ keyword }" />
	                		<c:param name="page" value="${ currentPage - 1 }"/>
	                	</c:url>
	                    <a href="${prev }" class="prev arrow"></a>
	                    <c:forEach var="p" begin="${startPage }" end="${ endPage }" step="1">
	                     <c:url var="move" value="adminSblist.do">
	                     	<c:param name="searchType" value="${ searchType }" />
	                     	<c:param name="keyword" value="${ keyword }" />
	                		<c:param name="page" value="${ p}"/>
	                	</c:url>
	                    <c:if test="${p eq currentPage }">
	                    	<a>${p }</a>
	                    </c:if>
	                    <c:if test="${p ne currentPage }">
	                    	<a href="${move }">${p }</a>
	                    </c:if>
	                    </c:forEach>
	                     <c:url var="next" value="adminSblist.do">
	                     <c:param name="searchType" value="${ searchType }" />
	                     	<c:param name="keyword" value="${ keyword }" />
	                		<c:param name="page" value="${ currentPage + 1 }"/>
	                	</c:url>
	                	<a href="${next }" class="next arrow"></a>
	                    <c:url var="last" value="adminSblist.do">
	                    	<c:param name="searchType" value="${ searchType }" />
	                     	<c:param name="keyword" value="${ keyword }" />
	                		<c:param name="page" value="${ maxPage}"/>
	                	</c:url>
	                    <a href="${last }" class="last arrow"></a>
	              </div>
	                </c:if>
				 <c:if test="${empty keyword}">
	                	<div class="paging">
	                	<c:url var="start" value="adminblist.do">
	                	<c:param name="page" value="1"/>
	                	</c:url>
	              		<a href="${ start }" class="first arrow"></a>
	                    <c:url var="prev" value="adminNlist.do">
	                		<c:param name="page" value="${ currentPage - 1 }"/>
	                	</c:url>
	                    <a href="${ prev }" class="prev arrow"></a>
	                    <c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
	                     <c:url var="move" value="adminblist.do">
	                		<c:param name="page" value="${ p }"/>
	                	</c:url>
	                    <c:if test="${ p eq currentPage }">
	                    	<a>${ p }</a>
	                    </c:if>
	                    <c:if test="${ p ne currentPage }">
	                    	<a href="${move }">${p }</a>
	                    </c:if>
	                    </c:forEach>
	                     <c:url var="next" value="adminblist.do">
	                		<c:param name="page" value="${ currentPage + 1 }"/>
	                	</c:url>
	                	<a href="${ next }" class="next arrow"></a>
	                    <c:url var="last" value="adminblist.do">
	                		<c:param name="page" value="${ maxPage }"/>
	                	</c:url>
	                    <a href="${ last }" class="last arrow"></a>
	                </div>
	            </c:if>
		</div>
	</body>
</html>