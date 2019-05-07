<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<c:import url="../common/header.jsp"/>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
        <script>
		    function daumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                document.getElementById('brokers_address').value = data.roadAddress;
		            }
		        }).open();
		    }
		</script>
	</head>
	<body>
		<c:import url="../common/top.jsp"/>
		<div id="member-info">
			<div class="prodLitArea myInfoArea">
	            <form name="infoForm" id="infoForm" method="post" action="updateCompany.do">
				<div class="myInfoWrap">
					<div class="myInfoTitBox">
						<strong>업체 정보</strong>
					</div>
					
					<div class="myContent">
						<h2 class="myInfoTit"><span>업체 정보</span></h2>
	
						<div class="myInfoTop">
							<span>업체 정보 수정</span>
						</div>
						<div>
							<input type="hidden" name="com_id" value="${company.com_id}" style="width:380px; trans-300" />
						</div>
						<div class="myInfoCon">
							<table>
								<tr>
									<th>아이디</th>
									<td>
										<input type="text" name="com_name" value="${company.com_id}" style="width:380px;" readonly />
									</td>
								</tr>
							
								<tr>
									<th>중개 사무소명</th>
									<td>
										<input type="text" name="com_name" value="${company.com_name}" style="width:380px;" />
									</td>
								</tr>
								<tr>
									<th>대표자 이름</th>
									<td>
										<input type="text" name="com_ceo" value="${company.com_ceo}" style="width:380px;" />
									</td>
								</tr>
								<tr>
									<th>사업자 등록번호</th>
									<td>
										<input type="text" name="com_no" value="${company.com_no}" style="width:380px;" />
									</td>
								</tr>
								<tr>
									<th>중개사 등록번호</th>
									<td>
										<input type="text" name="brokers_no" value="${company.brokers_no}" style="width:380px;" />
									</td>
								</tr>
								<tr>
									<th>업체 주소</th>
									<td>
										<input type="text" id="brokers_address" name="brokers_address" value="${company.brokers_address}" style="width:281.77px;">
										<input type="button" onclick="daumPostcode()" value="우편번호 찾기">
									</td>
								</tr>
								<tr>
									<th>업체 대표 번호</th>
									<td>
										<input type="text" name="com_phone" value="${company.com_phone}" style="width:380px;" />
									</td>
								</tr>
								<tr>
									<th>인사말</th>
									<td>
										<input type="text" name="com_content" value="${company.com_content}" style="width:380px;" />
									</td>
								</tr>
								<tr>
									<th>업체 대표 이메일</th>
									<td>
										<input type="email" name="com_email" value="${company.com_email}" style="width:380px;" />
									</td>
								</tr>
							</table>
						</div>
					</div>
	
					<div class="btnCtrl">
						<button type="submit" class="btnSave" style="vertical-align: top;">수정</button>
						<a href="history.back();" class="btnCancel" style="vertical-align: top;"><span>이전</span></a>
					</div>
				</div>
			    </form>
			</div>
		</div>
	</body>
</html>