<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<c:import url="../header.jsp"/>
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
						url: "selectUserSearch.do",
						data: {selectVal: selectVal, textVal: textVal, checkVal: checkVal},
						type: "post",
						datatype: "json",
						success: function(data){
							$("#dis").hide();
							$("#add").empty() 
							
							var jsonStr = JSON.stringify(data);
							var json = JSON.parse(jsonStr);
							
							for(var i in json.list){
								var state = json.list[i].state;
		                         var user_id = json.list[i].user_id;
								$("#add").html($("#add").html() + ("<tr><td><p>" +
											   user_id + "</p></td><td><p>" + 
											   json.list[i].user_name + "</p></td><td><p>" + 
											   json.list[i].user_email + "</p></td><td><p>" + 
											   json.list[i].user_phone + "</p></td><td><p>" +
											   state + "</p></td><td class='tModify' id='add" + i + "'>" + 
											   "<a href='adminUserUpdate.do?user_id=" + user_id + "'>수정</a>"));
												if(state == "일반"){
											
				                                    $("#add" + i).html($("#add" + i).html() + ("<a href='adminUserDelte.do?id=" + user_id + "'>제재</a></td></tr>"));
				                                 }else if(state == "제재"){
				                                    $("#add" + i).html($("#add" + i).html() + ("<a href='adminUserDelteUndo.do?id=" + user_id + "'>제재 해제</a></td></tr>"));
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
	</head>
	<body>
		<div id="admin-header">
			<a href="/bangbang"><h1><strong>BANG BANG</strong></h1></a>
		</div>
		
		<div id="bangData" class="container">
			<div class="topTabBox">
				<ul>	
					<li class="on"><a href="adminUserList.do"><span>회원 관리</span></a></li>
					<li><a href="adminComList.do"><span>업체 관리</span></a></li>
					<li><a href="adminblist.do;"><span>방 매물 관리</span></a></li>
					<li><a href="adminNlist.do"><span>공지 관리</span></a></li>
					<li ><a href="adminQNAlist.do"><span>Q&A 관리</span></a></li>
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
					<div class="select_box" style="float:left; width:92px;">
						<select id="selectVal" name="selectVal">
							<option value ="all" >전체</option>
							<option value ="user_id" >아이디</option>
							<option value ="user_name" >이	름</option>
							<option value ="user_email" >이메일</option>
						</select>
					</div>
					<input type="text" id="textVal" name="textVal" placeholder="검색 할 단어를 입력하시오." style="float:right;"/>
				</div>
				<div style="clear:both;"></div>
			</div>
			
			
			<div class="litCdBox">
				<dl>
					<dd class="litCd_1 left">

					</dd>
					<dd class="litCd_2 left">
						<strong class="infoTit">회원 관리</strong>
					</dd>
		
					<div class="clr"></div>
				</dl>
			</div>
			<table class="tableConWrap">
				<thead>
					<!-- 
						이걸 보면 매우 놀라겠지. width값이 다 정해져 있어서.
						하지만 놀랄 필욘 없어 사용법만 알면 자유자재로 사용할 수 있다구. 사용법을 알려주겠어.
						우선 체크 박스 3% 를 제외하고 나머지 97% 안에서 원하는 것을 계산하여 넣으면 돼(체크박스는 항상 빼고 계산해줭)
						예를들어 th가 체크박스를 포함하여 5개 필요하다고 하면
						나머지 4개가 97%를 나눠 쓰면 되는거지!
						그래서 3개는 25% 쓰고 나머지 한개는 23%를 쓰면 100%가 되는고얌. width값 나누는건 어렵지 않지?
						그렇다면 여기서 의문이 들겠지. 대체 왜이렇게 복잡하게 쓰느냐
						그건.테이블 width가 100%이여서 그렇다고 대답해 줄 수 있어.
						그럼 좋은 기능구현 시간이 되길 발애
						추가로 질문이 있다면 카톡으로 물어보라구 찡-긋
					-->
					
					<th style="width:15%;">아이디</th>
					<th style="width:15%;">회원명</th>
					<th style="width:40%;">이메일</th>
					<th style="width:20%;">전화번호</th>
					<th style="width:10%;">분류</th>
					<th style="width:10%;" class="tModify">관리</th>
				</thead>
				<tbody id="add">
				</tbody>
				<tbody id="dis">
				<c:forEach items="${userList }" var="user">
					<tr>
						
						<td>
							<p>${user.user_id }</p>							
						</td>
						<td >
							<p>${user.user_name }</p>							
						</td>
						<td>
							<p>${user.user_email }</p>							
						</td>
						<td>
							<p>${user.user_phone }</p>
						</td>
						<td>
							<p>${user.state }</p>
						</td>
						<td class="tModify">
							<c:url var="adminUserUpdateView" value="adminUserUpdateView.do">
								<c:param name="user_id" value="${user.user_id }" />
							</c:url>
							<c:url var="adminUserDelte" value="adminUserDelte.do">
								<c:param name="id" value="${user.user_id }" />
							</c:url>
							<c:url var="adminUserDelteUndo" value="adminUserDelteUndo.do">
								<c:param name="id" value="${user.user_id }" />
							</c:url>
							<a href="${adminUserUpdateView}" >수정</a>
							<c:if test="${user.state eq '일반' }" >
							<a href="${adminUserDelte}" >제재</a>
							</c:if>
							<c:if test="${user.state eq '제재' }" >
							<a href="${adminUserDelteUndo}" >제재 해제</a>
							</c:if>
						</td>
				
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</body>
</html>