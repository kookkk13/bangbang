<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../common/header.jsp" />
</head>
<body>
	<c:import url="../common/top.jsp" />
	<div class="myInfoArea">
	<div class="searchWrap myInfoWrap">
		<div class="myInfoTitBox">
			<strong>매물 관리</strong>
		</div>
		<div class="myContent">
			<h2 class="myInfoTit"><span>매물 관리</span></h2>
			<div class="myInfoTop">
				<span>내 매물 관리</span>
				<div class="clr">
				</div>
			</div>
			
			<div class="litCdBox" style="border-top:1px solid #c2c2c2;">
				<dl>
					<dd class="litCd_2 left">
						<strong class="infoTit">방 매물 관리</strong><br>
						매물 갯수 : ${ listCount }
					</dd>
					<c:url var="bwrite" value="bwrite.do">
					</c:url>
				<dd class="litCd_2 right" style="margin-right:40px;">
					<a href="${ bwrite }" class="btnWrite" style=""><span>매물등록</span></a>
				</dd>
					<div class="clr"></div>
				</dl>
			</div>
			<table class="tableConWrap adminUserBangTable">
				<thead>
					<th style="width: 7%;">번호</th>
					<th style="width: 7%;">매물번호</th>
					<th style="width: 18%;">매물소재지</th>
					<th style="width: 7%;">건물형태</th>
					<th style="width: 7%;">계약형태</th>
					<th style="width: 5%;">보기</th>
					<th style="width: 7%;">매물삭제여부</th>
					<th style="width: 7%;">삭제일자</th>
					<th style="width: 7%;">계약상태</th>
					<th style="width: 10%;" class="tModify">관리</th>
				</thead>
				<tbody>
					<c:if test="${empty blist }">
					<div align="center"><br>검색된 매물정보가 존재하지 않습니다.</div>
				</c:if>
					<c:set var="no" value="${ startRow }"/>
					<c:forEach items="${blist}" var="Bang" >
						<c:url var="binfo" value="binfo.do">
							<c:param name="pro_no" value="${ Bang.pro_no }" />
							<c:param name="id" value="${ Bang.id }" />
							<c:param name="userType" value="${ userType }"/>
						</c:url>
						<c:if test="${ Bang.pro_del eq 'Y'}">
							<tr class="bangDel">
						</c:if>
						<c:if test="${ Bang.contract_yn eq 'Y'}">
							<tr class="conDone">
						</c:if>
						<c:if test="${ Bang.pro_del eq 'N' && Bang.contract_yn eq 'N'}">
							<tr>
						</c:if>
							<td>
								<p>${ no }</p>
								<c:set var="no" value="${ no+1 }"/>
							</td>
							<td>
								<p>${ Bang.pro_no }</p>
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
							<c:if test="${ Bang.pro_del eq 'N' && Bang.contract_yn eq 'N'}">
								<td class="tModify"><a href="${ binfo  }" target="_blank">보기</a></td>
							</c:if>
							<c:if test="${ Bang.pro_del eq 'Y' || Bang.contract_yn eq 'Y'}">
								<td class="tModify"></td>
							</c:if>
							<td>
								<p>${ Bang.pro_del }</p>
							</td>
							<td>
								<c:if test="${ Bang.pro_del eq 'Y'}">
								${ Bang.del_date }
								</c:if>
							</td>
								<c:if test="${ Bang.contract_yn eq 'N' && Bang.pro_del eq 'N'}">
									<c:url var="contract_y" value="contractBang.do">
										<c:param name="pro_no" value="${ Bang.pro_no }"/>
										<c:param name="userType" value="${ userType }"/>
										<c:param name="id" value="${ Bang.id }"/>
									</c:url>
									<td class="tModify">
										<a href="${ contract_y }">계약완료</a>
									</td>
								</c:if>
								<c:if test="${ Bang.contract_yn eq 'Y' }">
								<td>
									<p>계약완료</p>
								</td>
								</c:if>
								<c:if test="${ Bang.pro_del eq 'Y' }">
								<td>
								</td>
								</c:if>
							<td class="tModify">
								<c:url var="bupView" value="bupdateView.do">
									<c:param name="pro_no" value="${ Bang.pro_no }" />
									<c:param name="id" value="${ Bang.id }" />
									<c:param name="userType" value="${ userType }"/>
								</c:url>
								<c:url var="bdel" value="userBdel.do">
									<c:param name="pro_no" value="${ Bang.pro_no }" />
									<c:param name="id" value="${ Bang.id }" />
									<c:param name="userType" value="${ userType }"/>
									<c:param name="page" value="${ currentPage }"/>
								</c:url>
								<c:if test="${ Bang.pro_del eq 'N' }">
									<c:if test="${ Bang.contract_yn eq 'N' }">
										<a href="${ bupView }">수정</a>
										<a href="${ bdel }">삭제</a>
									</c:if>
								</c:if>
								</td>
	
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${empty blist }">
				<div align="center">
					<br>작성하신 매물이 존재하지 않습니다.
				</div>
			</c:if>
			<c:if test="${!empty blist}">
				<div class="paging">
					<c:url var="start" value="userBangPage.do">
						<c:param name="page" value="1" />
						<c:param name="id" value="${ sessionScope.loginMember.id }" />
					</c:url>
					<a href="${ start }" class="first arrow"></a>
					<c:url var="prev" value="userBangPage.do">
						<c:param name="id" value="${ sessionScope.loginMember.id }" />
						<c:param name="page" value="${ currentPage - 1 }" />
					</c:url>
					<a href="${ prev }" class="prev arrow"></a>
					<c:forEach var="p" begin="${ startPage }" end="${ endPage }"
						step="1">
						<c:url var="move" value="userBangPage.do">
							<c:param name="page" value="${ p }" />
							<c:param name="id" value="${ sessionScope.loginMember.id }" />
						</c:url>
						<c:if test="${ p eq currentPage }">
							<a>${ p }</a>
						</c:if>
						<c:if test="${ p ne currentPage }">
							<a href="${move }">${p }</a>
						</c:if>
					</c:forEach>
					<c:url var="next" value="userBangPage.do">
						<c:param name="page" value="${ currentPage + 1 }" />
						<c:param name="id" value="${ sessionScope.loginMember.id }" />
					</c:url>
					<a href="${ next }" class="next arrow"></a>
					<c:url var="last" value="userBangPage.do">
						<c:param name="page" value="${ maxPage }" />
						<c:param name="id" value="${ sessionScope.loginMember.id }" />
					</c:url>
					<a href="${ last }" class="last arrow"></a>
				</div>
			</c:if>
			
		</div>
	</div>
	</div>
</body>
</html>