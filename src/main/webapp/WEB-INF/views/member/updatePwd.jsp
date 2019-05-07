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
               <form name="infoForm" id="infoForm" method="post" action="updatePwd.do">
            <div class="myInfoWrap">
               <div class="myInfoTitBox">
                  <strong>회원 정보</strong>
               </div>
               
               <div class="myContent">
                  <h2 class="myInfoTit"><span>회원 정보</span></h2>
   
                  <div class="myInfoTop">
                     <span>비밀번호 변경</span>
                  </div>
                  <div>
                     <input type="hidden" name="id" value="${loginMember.id}" style="width:380px; trans-300" />
                  </div>
                  <div class="myInfoCon">
                     <table>
                        <tr>
                           <th>변경 할 비밀번호</th>
                           <td>
                              <input type="password" name="pwd" style="width:380px;" />
                           </td>
                        </tr>
                     
                        <tr>
                           <th>비밀번호 확인</th>
                           <td>
                              <input type="password" name="pwd2" style="width:380px;" />
                           </td>
                        </tr>
                     </table>
                  </div>
               </div>
   
               <div class="btnCtrl">
                  <button type="submit" class="btnSave" style="vertical-align: top;">변경</button>
                  <a href="javascript:history.go(-1);" class="btnCancel" style="vertical-align: top;"><span>이전</span></a>
               </div>
            </div>
             </form>
         </div>
      </div>
   </body>
</html>