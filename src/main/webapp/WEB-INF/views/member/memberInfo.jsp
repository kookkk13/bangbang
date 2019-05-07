<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<c:import url="/views/common/header.jsp"/>
	</head>
	<body>
		<c:import url="/views/common/top.jsp"/>
		<div id="member-info">
			<div class="prodLitArea myInfoArea">
	            <form name="infoForm" id="infoForm" method="post" action="">
				<div class="myInfoWrap">
					<div class="myInfoTitBox">
						<strong>내 계정</strong>
					</div>
					
					<div class="myContent">
						<h2 class="myInfoTit"><span>내 계정</span></h2>
	
						<div class="myInfoTop">
							<span>개인정보</span>
							<a href="javascript:void(0);" class="btnWithdrawl"><span>회원탈퇴</span></a>
							<div class="clr"></div>
						</div>
	
						<div class="myInfoCon">
							<table>
								<tr>
									<th>프로필 사진</th>
									<td>
										<img src="../../resources/images/img-profile-user.png" class="photo1" alt="사진변경" />
										<p><input type="file" value="이미지 업로드" /></p>
									</td>
								</tr>
								<tr>
									<th>아이디</th>
									<td>
										<input type="text" name="id" style="width:285px;" />
									</td>
								</tr>
								<tr>
									<th>이름</th>
									<td>
										<input type="text" name="name" style="width:285px;" />
									</td>
								</tr>
								<tr>
									<th>휴대폰 번호</th>
									<td>
										<div class="select trans-300" style="width:130px;">
											<span class="ctrl"><span class="arrow"></span></span>
											<button type="button" name="tel1" for="tel1" class="my_value">010</button>
											<ul name="tel1" id="tel1" class="a_list" title="select tel1">
	                                            <li class=""><a href="javascript:void(0);" value="">선택하세요</a></li>
	                                            <li class=""><a href="javascript:void(0);" value="">010</a></li>
	                                            <li class=""><a href="javascript:void(0);" value="">011</a></li>
	                                            <li class=""><a href="javascript:void(0);" value="">016</a></li>
	                                            <li class=""><a href="javascript:void(0);" value="">017</a></li>
	                                            <li class=""><a href="javascript:void(0);" value="">018</a></li>
	                                            <li class=""><a href="javascript:void(0);" value="">019</a></li>
											</ul>
										</div>
										<span class="bar" style="width:25px;">-</span>
										<input type="text" name="tel2" value="" style="width:130px;" />
										<span class="bar" style="width:25px;">-</span>
										<input type="text" name="tel3" value="" style="width:130px;" />
									</td>
								</tr>
								<tr>
									<th>이메일 주소</th>
									<td>
										<input type="email" name="email" value="123@gmail.com" style="width:285px;" />
									</td>
								</tr>
								<tr>
									<th>통화가능시간</th>
									<td>
										<dl>
											<dt>월요일 ~ 금요일</dt>
											<dd>
												<input type="number" min="00" max="24" style="width:80px;" />
												<span class="bar" style="width:25px;">:</span>
												<input type="number" min="00" max="59" style="width:80px;"  />
											</dd>
											<dd><span class="bar" style="width:25px;">~</span></dd>
											<dd>
												<input type="number" min="00" max="24" style="width:80px;"  />
												<span class="bar" style="width:25px;">:</span>
												<input type="number" min="00" max="59" style="width:80px;"  />
											</dd>
										</dl>
										<dl>
											<dt>
												<select>
													<option>추가 가능시간</option>
													<option>토요일</option>
													<option>일요일</option>
													<option>공휴일</option>
													<option>토,일,공휴일</option>
												</select>
											</dt>
											<dd>
												<input type="number" min="00" max="24" style="width:80px;" />
												<span class="bar" style="width:25px;">:</span>
												<input type="number" min="00" max="59" style="width:80px;"  />
											</dd>
											<dd><span class="bar" style="width:25px;">~</span></dd>
											<dd>
												<input type="number" min="00" max="24" style="width:80px;"  />
												<span class="bar" style="width:25px;">:</span>
												<input type="number" min="00" max="59" style="width:80px;"  />
											</dd>
										</dl>
									</td>
								</tr>
								<tr>
									<th>비밀번호 변경</th>
									<td class="pwChRow">
										<p><input type="password" name="old_password" placeholder="현재 비밀번호" class="pwCh1" style="width:440px;" /><span class="txtGray">현재 비밀번호를 입력하세요</span></p>
										<p><input type="password" name="new_password_1" placeholder="변경될 비밀번호" class="pwCh2" style="width:440px;" /><span class="txtGray">변경될 비밀번호를 입력하세요</span></p>
										<p><input type="password" name="new_password_2" placeholder="변경될 비밀번호 확인" class="pwCh3" style="width:440px;" /><span class="txtGray">현재 비밀번호를 한번더 입력하세요</span></p>
									</td>
								</tr>
							</table>
						</div>
					</div>
	
					<div class="btnCtrl">
						<a href="/" class="btnCancel"><span>취소</span></a>
						<a href="javascript:void(0);" onclick="$.member.info.onModify();" class="btnSave"><span>확인</span></a>
					</div>
				</div>
			    </form>
			</div>
		</div>
	</body>
</html>