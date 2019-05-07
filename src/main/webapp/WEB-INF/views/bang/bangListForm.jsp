<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<c:forEach items="${blist}" var="Bang">
		<c:url var="binfo" value="binfo.do">
			<c:param name="pro_no" value="${ Bang.pro_no }" />
			<c:param name="id" value="${ Bang.id }"/>
			<c:if test="${ !empty sessionScope.loginMember }">
				<c:param name="userid" value="${ sessionScope.loginMember.id }"/>
			</c:if>
			<c:param name="userType" value="all"/>
			<%-- <c:param name="pro_id" value="${ Bang.id }"/> --%>
		</c:url>
		<c:set var="today" value="<%= new java.util.Date() %>" />
		<li class="prodLit curPoint" id="bangLi">
			<a href="${ binfo }" target="_blank">
		<%-- <a href="binfo.do?pro_no=${ Bang.pro_no }&id=${ Bang.id }"> --%>
			<div class="prodI_Box">
			<c:forEach items="${ bimg }" var="Bimg">
			<c:if test="${ Bang.pro_no eq Bimg.pro_no }">
				<div class="btnInfo">
					<img 
					src="${ pageContext.request.contextPath }/resources/files/bang/${ Bimg.rename_file }"
					 class="p_Img" onerror="this.src='${ pageContext.request.contextPath }/resources/images/no_image_242_161.jpg'"/>
				</div>
			</c:if>
			</c:forEach>
				<div class="prodI_Sum">
					<dl>
						<dd>
							<c:if test="${ Bang.con_type eq '월세'}">
								<span class="p_Way p_Way_a">월세</span>
								<strong class="p_price"><fmt:formatNumber value="${ Bang.deposit }" type="number"/> / ${Bang.rent}</strong>
							</c:if>
							<c:if test="${ Bang.con_type eq '단기임대'}">
								<span class="p_Way p_Way_c">단기임대</span>
								<strong class="p_price"><fmt:formatNumber value="${ Bang.deposit }" type="number"/> / ${Bang.rent}</strong>
							</c:if>
							<c:if test="${ Bang.con_type eq '전세' }">
								<span class="p_Way p_Way_b">전세</span>
								<strong class="p_price"><fmt:formatNumber value="${ Bang.deposit }" type="number"/></strong>
							</c:if>
							<c:if test="${ Bang.con_type eq '매매' }">
								<span class="p_Way p_Way_d">매매</span>
								<strong class="p_price"><fmt:formatNumber value="${ Bang.deposit }" type="number"/></strong>
							</c:if>
						</dd>
						<dd>
							<span class="b_opt_1" id="loption">&nbsp; 건물형태 : ${ Bang.build_type }</span>
							<c:if test="${ !empty Bang.move_date }">
								<c:if test="${ Bang.move_date < today }">
									<span class="b_opt_2" id="roption">&nbsp; 입주가능일 : 즉시입주가능</span>
								</c:if>
								<c:if test="${ Bang.move_date >= today }">
									<span class="b_opt_2" id="roption">&nbsp; 입주가능일 : ${ Bang.move_date }</span>
								</c:if>

							</c:if>
							<c:if test="${ empty Bang.move_date }">
								<span class="b_opt_2" id="roption">&nbsp; 입주가능일 : 즉시입주가능</span>
							</c:if>

						</dd>
						<%-- <dd>
							<span class="b_keyword">${ Bang.id }</span>
							<span class="b_keyword">${ Bang.pro_no }</span>
						</dd> --%>
					</dl>
				</div>
			</div>
			</a>
		</li>
	</c:forEach>
</body>
</html>