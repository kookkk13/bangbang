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
		<div class="joinPopup">
			<div class="memberBox memJoinBox memJoinMainBox">
				<h2 class="memTit joinTit">회원가입</h2>
				<p>회원가입 유형을 선택해 주세요.</p>
				<a href="userJoin.do" class="btnBig btnUser trans-300">일반 회원가입</a>
				<a href="insertCompanyPage.do" class="btnBig btnSeller btnJoin trans-300">업체 회원가입</a>
			</div>
		</div>
	</body>
</html>