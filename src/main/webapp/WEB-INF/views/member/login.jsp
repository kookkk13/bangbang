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
				var msg = '${msg}';
				if(msg != null && msg != ""){
					alert(msg);
				}
			});
		</script>
	</head>
	<body>
		<div id="member-login" class="loginPopup">
			<div class="memberBox memLoginBox">
				<h2 class="memTit loginTit">로그인</h2>
				<div class="login_form">
					<form name="login" id="login" method="post" action="login.do">
		            <span class="warning">&nbsp;</span>
					<ul>
						<li>
		                    <label for="id">아이디</label>
		                    <input type="text" name="id" id="id" value="" class="trans-300" title="" required>
		                </li>
						<li>
		                    <label for="pwd">비밀번호</label>
		                    <input type="password" name="pwd" id="pwd" value="" class="trans-300" required>
		                </li>
					</ul>
					<input type="submit" class="btnLogin trans-300" value="로그인" />
					<div class="f_menuBox">
						<a href="memberJoinMainPage.do" class="btnJoin">회원가입</a>
						<span class="bar">|</span>
						<a href="findPwdPage.do" class="btnfindPw">비밀번호 찾기</a>
					</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>