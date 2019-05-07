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
		<div id="" class="joinPopup">
			<div class="memberBox memJoinBox">
				<h2 class="memTit joinTit">회원가입</h2>
				<div class="join_form">
					<form name="joinForm" id="joinForm" method="post" action="">
					<ul>
						<li>
							<label for="join-name">이름</label>
							<input type="text" name="name" style="width:380px; trans-300" /><span class="warning"></span>
						</li>
						<li>
							<label for="join-email">이메일</label>
							<input type="text" name="email1" value="" class="email_1 trans-300"  style="width:120px;"><span class="warning"></span>
							<b class="at">@</b>
							<input type="text" name="email2" value="" class="email_2 trans-300"  style="width:120px;"><span class="warning"></span>
							<div class="select aVal trans-300" style="width:110px;">
		                        <span class="ctrl"><span class="arrow"></span></span>
		                        <button type="button" for="emailTail" class="my_value">직접입력</button>
		                        <ul name="emailTail" id="emailTail" class="a_list region" title="select emailTail">
		                        	<li><a href="javascript:void(0);">직접입력</a></li>
		                           	<li><a href="javascript:void(0);">naver.com</a></li>
		                           	<li><a href="javascript:void(0);">hanmail.net</a></li>
		                           	<li><a href="javascript:void(0);">gmail.com</a></li>
		                           	<li><a href="javascript:void(0);">nate.com</a></li>
		                           	<li><a href="javascript:void(0);">daum.net</a></li>
		                           	<li><a href="javascript:void(0);">hotmail.com</a></li>
		                        </ul>
							</div>
						</li>
						<li>
							<label for="join-pw">비밀번호</label>
							<input type="password" name="password" class="trans-300" style="width:380px;" /><span class="warning"></span>
						</li>
						<li>
							<label for="join-pwChk">비밀번호확인</label>
							<input type="password" name="passwordChk" class="trans-300" style="width:380px;" /><span class="warning"></span>
						</li>
						<li>
							<label for="join-tel">핸드폰번호</label>
							<div class="select tVal trans-300" style="width:115px;">
		                        <span class="ctrl"><span class="arrow"></span></span>
		                        <button type="button" for="tel1" class="my_value">010</button>
		                        <ul name="tel1" id="tel1" class="a_list region" title="select tel1">
		                        	<li><a href="javascript:void(0);">010</a></li>
		                        	<li><a href="javascript:void(0);">011</a></li>
		                        	<li><a href="javascript:void(0);">016</a></li>
		                        	<li><a href="javascript:void(0);">017</a></li>
		                        	<li><a href="javascript:void(0);">018</a></li>
		                        	<li><a href="javascript:void(0);">019</a></li>
		                        </ul>
							</div>
							<b class="dash">-</b>
							<input type="text" name="tel2" value="" class="tel_1 trans-300"  style="width:115px;"><span class="warning"></span>
							<b class="dash">-</b>
							<input type="text" name="tel3" value="" class="tel_2 trans-300"  style="width:115px;"><span class="warning"></span>
						</li>
					</ul>
					<input type="submit" class="btnJoin trans-300" value="일반 회원가입">
					</form>
				</div>
			</div>
		</div>
	</body>
</html>