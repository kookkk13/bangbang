<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	</head>
	<body>
		<div id="bang-productList" class="prodLitWrap">
		    <div class="prodTitBox">
		        <strong>단위</strong>
		        <span>/ (만원)</span>
		    </div>
		    <ul class="bangProdList">
		        <c:import url="bangListForm.jsp" />
		    </ul>
		</div>
	</body>
</html>