<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	</head>
	<body>
		<div id="bang-searchForm" class="sideNavWrap sideNavLitWrap">
			<form action="userSBang.do" name="searchBang"id="searchBang" onSubmit="return CheckForm(this)" method="post">
			<div class="sideNav nav_1">
			<br>
				<br>
				<br>
				<h3 class="navTit">${ sessionScope.loginMember.id } 찜목록</h3>
				
				<br>
				<br>
				
				<dl>
					<dd class="section section3">
					<strong> 나의 찜목록 갯수</strong>
					<strong> ${ blist.size() } 개 </strong>
					</dd>
				</dl>
					<br><br>
			</div>
				</form>
		</div>
	</body>
</html>