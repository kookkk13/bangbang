<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
         <c:import url="../common/header.jsp"/>
         <script type="text/javascript">
         
            function selectMyScheduler() {
               var id = "${sessionScope.loginMember.id}";
               
               $.ajax({
               url: "selectMyScheduler.do",
               data: {id: id},
               type: "post",
               datatype: "json",
               success: function(data){
                  /* $("#dis").hide(); */
                  $("#add").empty();
                  
                  var jsonStr = JSON.stringify(data);
                  var json = JSON.parse(jsonStr);

                   if(json.list.length == 0) {
                     $("#add").html($("#add").html() + ("<tr><td colspan='9'>조회 결과가 없습니다.</td></tr>"));
                     return true;
                  } 
                  
                  for(var i in json.list){
                     var book_no = json.list[i].book_no;
                     var pro_no = json.list[i].pro_no;
                     if ( json.list[i].com_name != null){
                     $("#add").html($("#add").html() + ("<tr><td><p>" +
                              book_no + "</p></td><td><p>" + 
                              pro_no + "</p></td><td><p>" + 
                              json.list[i].deposit + " / " + json.list[i].rent + "</p></td><td><p>" +
                              json.list[i].build_type + "</p></td><td><p>" +
                              json.list[i].con_type + "</p></td><td><p>" +
                              json.list[i].book_date + "</p></td><td><p>" +
                              json.list[i].com_name + "</p></td><td><p>" + 
                              json.list[i].com_phone + "</p></td><td class='tModify' id='add" + i + "'>" +
                              "<a href='binfo.do?userType=usermy&pro_no="+ pro_no +"&id="+ json.list[i].com_id+"'>매물보기</a>" + 
                              "<button class='del' value='" + book_no + "'>삭제</button>"));
                     } else {
                        $("#add").html($("#add").html() + ("<tr><td><p>" +
                                 book_no + "</p></td><td><p>" + 
                                 pro_no + "</p></td><td><p>" + 
                                 json.list[i].deposit + " / " + json.list[i].rent + "</p></td><td><p>" +
                                 json.list[i].build_type + "</p></td><td><p>" +
                                 json.list[i].con_type + "</p></td><td><p>" +
                                 json.list[i].book_date + "</p></td><td><p>" +
                                 json.list[i].user_name + "</p></td><td><p>" + 
                                 json.list[i].user_phone + "</p></td><td class='tModify' id='add" + i + "'>" +
                                 "<a href='binfo.do?userType=usermy&pro_no="+ pro_no +"&id="+ json.list[i].com_id+"'>매물보기</a>" + 
                                 "<button class='del' value='" + book_no + "'>삭제</button>"));
                     }
                  } 
               },
               error: function(jqXHR, textstatus, errorthrown){
                  console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
               }
            }); //ajax
            }
            
          $(function(){
             selectMyScheduler();
            
            $(document).on("click", ".del", function(){
               
                 $.ajaxPost('deleteScheduler.do', {
                  bookNo: this.value
               }, function(result) {    
                  alert('삭제되었습니다.');
                  selectMyScheduler();
               }, function(result) {
                  alert(result.message);
               });  
            });
         
/*           $(function(){
             selectMyScheduler();
            
            $(document).on("click", ".del", function(){
               console.log("삭제=" + $('.del').val());
               
                $.ajaxPost('deleteScheduler.do', {
                  bookNo: $('.del').val()
               }, function(result) {
                  alert('삭제되었습니다.');
                  selectMyScheduler();
               }, function(result) {
                  alert(result.message);
               }); 
 
            }); */
            
//                $.ajax({
//               url: "deleteScheduler.do",
//               data: JSON.stringify({bookNo: $(".del").val()}),
//               type: "post",
//               contentType: 'application/json',
//               dataType : "json",
//               success: function(result){
//                  console.log("ok");
//                  if(result.success) {
//                     alert('삭제되었습니다.');
//                  } else {
//                     alert('에러...');
//                  }
//               },
//               error: function(jqXHR, textstatus, errorthrown){
//                  console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
//               }
//            });
            
         });
      </script>
   </head>
   <body>
      <c:import url="../common/top.jsp"/>
      <div id="member-info">
         <div class="prodLitArea myInfoArea">
            <div class="myInfoWrap">
               <div class="myInfoTitBox">
                  <strong>회원 정보</strong>
               </div>
               <div class="myContent">
                  <h2 class="myInfoTit"><span>회원 정보</span></h2>
                  <div class="myInfoTop">
                     <span>내 정보</span>
                     <a href="memberDel.do" class="btnWithdrawl"><span>회원탈퇴</span></a>
                     <div class="clr">
                     </div>
                  </div>
                  <div class="myInfoCon">
                     <table>
                        <tr>
                           <th>아이디</th>
                           <td>
                              <span>${user.user_id}</span>
                           </td>
                        </tr>
                        <tr>
                           <th>이름</th>
                           <td>
                                <span>${user.user_name}</span>
                             </td>
                         </tr>
                         <tr>
                            <th>전화번호</th>
                            <td>
                               <span>${user.user_phone}</span>
                            </td>
                        </tr>
                         <tr>
                            <th>이메일</th>
                            <td>
                                  <span>${user.user_email}</span>
                               </td>
                         </tr>
                     </table>
                   </div>
               </div>
               <div class="btnCtrl">
                  <a href="userUpdatePage.do" class="btnSave"><span>정보&nbsp;수정</span></a>
                   <a href="updatePwdPage.do" class="btnCancel"><span>비밀번호 수정</span></a>
               </div>
               
                  <!-- 예약 리스트 -->
               <div id="bangData" class="container">
                        <div class="myInfoTop">
							<span>내 예약 정보</span>
						</div> 
                  <table class="tableConWrap">
                     <thead>
                        <th style="width:5%;">예약 번호</th>
                        <th style="width:5%;">매물 번호</th>
                        <th style="width:10%;">보증금/월세</th>
                        <th style="width:10%;">건물 형태</th>
                        <th style="width:10%;">계약형태</th>
                        <th style="width:20%;">날짜/시간</th>
                        <th style="width:20%;">업체 이름</th>
                        <th style="width:20%;">연락처</th>
                        <th style="width:10%;" class="tModify">관리</th>
                     </thead>
                     <tbody id="add">
                     </tbody>
<%--                      <tbody id="dis">
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
                              <a href="${adminUserUpdateView}" >삭제</a>
                           </td>
                        </tr>
                     </c:forEach>
                     </tbody> --%>
                  </table>
               </div>
            </div>
         </div>
      </div>
   </body>
</html>