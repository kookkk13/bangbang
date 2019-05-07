<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<c:import url="../../common/header.jsp"/>
	</head>
	<body>
		<div id="admin-header">
			<a href="main.do"><h1><strong>BANG BANG</strong></h1></a>
		</div>
		
		<div id="bangData" class="container">
			<div class="topTabBox">
				<ul>	
					<li class="on"><a href="adminUserList.do"><span>회원 관리</span></a></li>
					<li><a href="selectAllCompany.do"><span>업체 관리</span></a></li>
					<li><a href="#;"><span>방 매물 관리</span></a></li>
					<li><a href="adminNlist.do"><span>공지 관리</span></a></li>
					<li><a href="adminQNAlist.do"><span>Q&A 관리</span></a></li>
				</ul>
			</div>
		<div id="member-info">
			<div class="prodLitArea myInfoArea">
	            <form name="infoForm" id="infoForm" method="post" action="adminUserUpdate.do">
				<div class="myInfoWrap">
					<div class="myInfoTitBox">
						<strong>회원 정보 수정</strong>
					</div>
					
					<div class="myContent">
						<h2 class="myInfoTit"><span>회원 정보 수정</span></h2>
	
						<div class="myInfoTop">
							<span>${user.user_name }님의  정보</span>
							
							<div class="clr"></div>
						</div>
	
						<div class="myInfoCon">
							<table>
								<tr>
									<th>아이디</th>
									<td>
										<input type="text" name="user_id" style="width:285px;" value="${user.user_id }" readonly />
									</td>
								</tr>
								<tr>
									<th>이름</th>
									<td>
										<input type="text" name="user_name" style="width:285px;" value="${user.user_name }" />
									</td>
								</tr>
								<tr>
									<th>휴대폰 번호</th>
									<td>
										<input type="text" name="user_phone" style="width:285px;" value="${user.user_phone }"/>
									</td>
								</tr>
								<tr>
									<th>이메일 주소</th>
									<td>
										<input type="email" name="user_email" style="width:285px;" value="${user.user_email }" />
									</td>
								</tr>
							</table>
						</div>
					</div>
	
					<div class="btnCtrl">
						<button type="submit" class="btnSave" style="vertical-align: top;">수정</button>
						<a href="adminUserList.do" class="btnCancel" style="vertical-align: top;"><span>돌아가기</span></a>
					</div>
				</div>
			    </form>
			</div>
		</div>
</body>
</html>