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
		
		<div id="member-info">
			<div class="prodLitArea myInfoArea">
	            <form name="infoForm" id="infoForm" method="post" action="userUpdate.do">
				<div class="myInfoWrap">
					<div class="myInfoTitBox">
						<strong>내 계정</strong>
					</div>
					
					<div class="myContent">
						<h2 class="myInfoTit"><span>내 계정</span></h2>
	
						<div class="myInfoTop">
							<span>개인정보</span>
							
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
						<a href="userMyPage.do" class="btnCancel" style="vertical-align: top;"><span>취소</span></a>
					</div>
				</div>
			    </form>
			</div>
		</div>
</body>
</html>