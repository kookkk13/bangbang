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
				<div class="myInfoWrap">
					<div class="myInfoTitBox">
						<strong>업체 정보</strong>
					</div>
					<div class="myContent">
						<h2 class="myInfoTit"><span>업체 정보</span></h2>
	
						<div class="myInfoTop">
							<span>업체 정보</span>
							<a href="memberDel.do" class="btnWithdrawl"><span>회원 탈퇴</span></a>
							<div class="clr"></div>
						</div>
	
						<div class="myInfoCon">
							<table>
								<tr>
									<th>아이디</th>
									<td>
										<span>
											${company.com_id}
										</span>
									</td>
								</tr>
								<tr>
									<th>중개 사무소명</th>
									<td>
										<span>
											${company.com_name}
										</span>
									</td>
								</tr>
								<tr>
									<th>대표자 이름</th>
									<td>
										<span>
											${company.com_ceo}
										</span>
									</td>
								</tr>
								<tr>
									<th>사업자 등록번호</th>
									<td>
										<span>
											${company.com_no}
										</span>
									</td>
								</tr>
								<tr>
									<th>
										중개사 등록번호
									</th>
									<td>
										<span>
											${company.brokers_no}
										</span>
									</td>
								</tr>
								<tr>
									<th>
										업체 주소
									</th>
									<td>
										<span>
											${company.brokers_address}
										</span>
									</td>
								</tr>
								<tr>
									<th>업체 대표 번호</th>
									<td>
										<span>
											${company.com_phone}
										</span>
									</td>
								</tr>
								<tr>
									<th>인사말</th>
									<td>
										<span>
											${company.com_content}
										</span>
									</td>
								</tr>
								<tr>
									<th>업체 대표 이메일</th>
									<td>
										<span>
											${company.com_email}
										</span>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="btnCtrl">
						<a href="updateCompanyPage.do" class="btnSave"><span>회원정보&nbsp;수정</span></a>
						<a href="updatePwdPage.do" class="btnCancel"><span>비밀번호&nbsp;변경</span></a>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>