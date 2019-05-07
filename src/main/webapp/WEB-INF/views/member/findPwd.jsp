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
            $("#next").click(function(){
               var id = $("#id").val();
               var type = "";
               
               if($("input:radio[id='type1']").is(":checked") == true){
                  type = $("#type1").val();
               }else{
                  type = $("#type2").val();
               }
            
               $.ajax({
                  url: "findPwd.do",
                  data: {id: id, type: type},
                  type: "post",
                  datatype: "json",
                  success: function(data){
                     var member = JSON.parse(data);
                     
                     if(member.id != null){
                        $("#next").css("display", "none");
                        $("#send").css("display", "");
                        $("#add").css("display", "");
                        
                        if(member.email == null){
                           $("#add2").html("<p>등록된 이메일이 없습니다. 이메일을 입력해주세요.</p>");
                        }else{
                           $("#email").val(member.email);
                           $("#add2").html("<p>등록한 이메일로 새 비밀번호를 전송하시겠습니까?</p>");
                        }
                     }else{
                        alert("해당 아이디가 존재하지 않습니다.");
                     }
                  },
                  error: function(jqXHR, textstatus, errorthrown){
                     console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
                  }
               });
            });
            
            $("#send").click(function(){
               var id = $("#id").val();
               var email = $("#email").val();
               
               if(email != ""){
                  $.ajax({
                     url: "sendMail.do", 
                     data: {email: email, id: id},
                     type: "post",
                     async: false,
                     success: function(data){
                        if(data == "ok"){
                           alert("회원님의 메일로 비밀번호가 발송되었습니다.");
                           location.href = "loginpage.do";
                        }else{
                           alert("메일 전송을 실패했습니다.");
                        }
                     },
                     error: function(jqXHR, textstatus, errorthrown){
                        console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
                     }
                  });
               } 
            });
         });
      </script>
   </head>
   <body>
      <div id="member-login" class="loginPopup">
         <div class="memberBox memLoginBox">
            <h2 class="memTit loginTit">비밀번호 찾기</h2>
            <div class="login_form">
               <form name="login" id="login" method="post" action="">
                  <span class="warning">&nbsp;</span>
               <ul>
                  <li>
                          <label for="id">회원</label>
                          <input type="radio" name="type" id="type1" value="개인" class="trans-300" checked /><label for="type1">개인</label> 
                          <input type="radio" name="type" id="type2" value="업체" class="trans-300" /><label for="type2">업체</label>
                      </li>
                  <li>
                          <label for="id">아이디</label>
                          <input type="text" name="id" id="id" class="trans-300" title="">
                      </li>
                      <li id="add" style="display: none">
                         <label>이메일</label><input type="email" name="email" id="email" class="trans-300" value="" style="vertical-align:right;" />
                      </li>
               </ul>
               </form>
               <div id="add2" style="margin-left:43px; margin-top:10px;">
               </div>
               <input type="button" id="next" name="next" class="btnLogin trans-300" value="다음" />
               <input type="button" id="send" name="send" class="btnLogin trans-300" value="확인" style="display:none"/>
            </div>
         </div>
      </div>
   </body>
</html>