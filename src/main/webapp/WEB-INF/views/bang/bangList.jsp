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
		<c:import url="../common/top.jsp"/>
		<div id="bang-lists">
			<c:import url="sideSearchBar.jsp" />
			<div class="prodLitArea contentsArea">
				<c:import url="bangListCon.jsp" />
			</div>
		</div>
	</body>
</html>