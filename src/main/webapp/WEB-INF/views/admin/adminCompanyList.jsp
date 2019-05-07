<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<c:import url="./header.jsp"/>
		<script type="text/javascript">
 			$(function(){
 				//jQuery.ajaxSettings.traditional = true;

 				var checkVal = "일반,제재,탈퇴";
 				var selectVal = "all";
 				var textVal = "";
				 				
 				$("input:checkbox").on("click", function(){
 					checkVal = "";
 					var count = 0;
 					
 					$('input[name="state"]:checked').each(function(index){
 					    var checked = $(this).prop('value');
 					    
 					    if(count == 0){
	 					    checkVal += checked;
 					    }else{
	 					    checkVal += "," + checked;
 					    }
 					    count++;
 					});
 			    });
 				
				$("#selectVal").change(function(){
					selectVal = $("#selectVal").val();
				});
				
				$("#textVal").on("input", function(){
					textVal = $("#textVal").val();
					
					$.ajax({
						url: "selectCompanySearch.do",
						data: {selectVal: selectVal, textVal: textVal, checkVal: checkVal},
						type: "post",
						datatype: "json",
						success: function(data){
							$("#dis").hide();
							$("#add").empty();
							
							var jsonStr = JSON.stringify(data);
							var json = JSON.parse(jsonStr);
							
							for(var i in json.list){
								var state = json.list[i].state;
								var com_id = json.list[i].com_id;
								
								$("#add").html($("#add").html() + ("<tr><td><p>" +
											   com_id + "</p></td><td><p>" + 
											   json.list[i].com_name + "</p></td><td><p>" + 
											   json.list[i].com_ceo + "</p></td><td><p>" +
											   json.list[i].brokers_address + "</p></td><td><p>" +
											   json.list[i].com_phone + "</p></td><td><p>" + 
											   state + "</p></td><td class='tModify' id='add" + i + "'>" + 
											   "<a href='updateCompanyAdminPage.do?com_id=" +
											   com_id + "'>수정</a>"));
								
											   if(state == "일반"){
												   $("#add" + i).html($("#add" + i).html() + ("<a href='adminComDelete.do?id=" + com_id + "'>제재</a></td></tr>"));
											   }else if(state == "제재"){
												   $("#add" + i).html($("#add" + i).html() + ("<a href='adminComDeleteUndo.do?id=" + com_id + "'>제재 해제</a></td></tr>"));
											   }else{
												   $("#add" + i).html($("#add" + i).html() + ("</td></tr>"));
											   }
							} 
						},
						error: function(jqXHR, textstatus, errorthrown){
							console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
						}
					}); 
				});
				
				var msg = '${msg}';
				if(msg != null && msg != ""){
					alert(msg);
				}
				
			});
		</script>
		<style type="text/css">
			tbody {height: 80px;}
		</style>
	</head>
	<body>
		<div id="admin-header">
			<a href="/bangbang"><h1><strong>BANG BANG</strong></h1></a>
		</div>
		
		<div id="bangData" class="container">
			<div class="topTabBox">
					<ul>
					<li ><a href="adminUserList.do"><span>회원 관리</span></a></li>
					<li class="on"><a href="adminComList.do"><span>업체 관리</span></a></li>
					<li><a href="adminblist.do"><span>방 매물 관리</span></a></li>
					<li><a href="adminNlist.do"><span>공지 관리</span></a></li>
					<li><a href="adminQNAlist.do"><span>Q&A 관리</span></a></li>
					</ul>
			</div>
			
			<div class="searchWrap">
				<div class="searchBox">
				<div class="check_box">
                  <span class="chk">
                     <input type="checkbox" name="state" id="state0" value="일반" checked/>
                     <label for="state0">일반</label>
                  </span>
                  <span class="chk">
                     <input type="checkbox" name="state" id="state1" value="제재" checked/>
                     <label for="state1">제재</label>
                  </span>
                  <span class="chk">
                     <input type="checkbox" name="state" id="state2" value="탈퇴" checked/>
                     <label for="state2">탈퇴</label>
                  </span>
               </div>
					<div class="select_box" style="float:left;">
						<select id="selectVal" name="selectVal">
							<option value="all">전체</option>
							<option value="com_id">업체 아이디</option>
							<option value="com_name">중개사무소명</option>
							<option value="com_ceo">대표자 이름</option>
						</select>
					</div>
					<input type="text" id="textVal" name="textVal" placeholder="검색 할 단어를 입력하시오." style="float:right;"/>
				</div>
				<div style="clear:both;"></div>
			</div>
			<div class="litCdBox">
				<dl>
					<dd class="litCd_2 left">
						<strong class="infoTit">회원 관리</strong>
					</dd>
		
					<div class="clr"></div>
				</dl>
			</div>
			<table class="tableConWrap">
				<thead>
					<th style="width:12%;">업체 아이디</th>
					<th style="width:15%;">중개 사무소명</th>
					<th style="width:12%;">대표자 이름</th>
					<th style="width:28%;">업체 주소</th>
					<th style="width:15%;">업체 대표 번호</th>
					<th style="width:8%;">분류</th>
					<th style="width:10%;" class="tModify">관리</th>
				</thead>
				<tbody id="add">
				</tbody>
				<tbody id="dis">
					<c:choose>
						<c:when test="${fn:length(companyList) > 0}">
							<c:forEach items="${companyList}" var="company">
								<tr>
									<td>
										<p>${company.com_id}</p>
									</td>
									<td>
										<p>${company.com_name}</p>
									</td>
									<td>
										<p>${company.com_ceo}</p>
									</td>
									<td>
										<p>${company.brokers_address}</p>
									</td>
									<td>
										<p>${company.com_phone}</p>
									</td>
									<td>
										<p>${company.state}</p>
									</td>
									<td class="tModify">
										<c:url var="updateCompanyAdminPage" value="updateCompanyAdminPage.do">
											<c:param name="com_id" value="${company.com_id}" />
										</c:url>
										<c:url var="adminComDelete" value="adminComDelete.do">
											<c:param name="id" value="${company.com_id}" />
										</c:url>
										<c:url var="adminComDeleteUndo" value="adminComDeleteUndo.do">
											<c:param name="id" value="${company.com_id}" />
										</c:url>
										<a href="${updateCompanyAdminPage}" >수정</a>
										<c:if test="${company.state eq '일반' }" >
										<a href="${adminComDelete}" >제재</a>
										</c:if>
										<c:if test="${company.state eq '제재' }" >
										<a href="${adminComDeleteUndo}" >제재 해제</a>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="7">
									<p>조회된 결과가 없습니다.</p>
								</td>
							<tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</body>
</html>