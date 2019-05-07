<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
      <script type="text/javascript">
        $(function(){
        	
          if(${sessionScope.loginMember.type eq '업체' || sessionScope.loginMember.type eq '개인'}){
            $(".myNavBox").css("height", "120px");
          }
        });
       
      </script>
	</head>
	<body>
		<div class="adminHeader">
		    <div class="global_top">
				<h1 class="logo"><a href="/bangbang"></a></h1>
				<div class="myNavBox">
				<c:if test="${!empty sessionScope.loginMember }">
					<a href="logout.do" ><span>로그아웃</span></a>
					<c:if test="${ sessionScope.loginMember.type eq '개인' }" >
		    		<a href="userMyPage.do" class="btnLogin btnMyinfo"><span>내 계정</span></a>
            <c:if test="${ sessionScope.loginMember.count > 0 }">
              <a href="userAdminSchedulerPage.do" class="btnLogin btnMyinfo"><span>일정 관리</span></a>
            </c:if>
          	</c:if>
		    		<c:if test="${ sessionScope.loginMember.type eq '업체' }" >
		    		<a href="companyMyPage.do" class="btnLogin btnMyinfo"><span>계정 관리</span></a>
            <a href="companyAdminSchedulerPage.do" class="btnLogin btnMyinfo"><span>일정 관리</span></a>
            </c:if>
          </c:if>
		    		<c:url var="userBang" value="userBangPage.do">
						<c:param name="id" value="${sessionScope.loginMember.id }"/>
					 </c:url>
		    		<c:if test="${ !empty sessionScope.loginMember && sessionScope.loginMember.id ne 'admin'}" >
		    		<a href="${ userBang }" class="btnLogin btnMyinfo"><span>매물 관리</span></a>
		    		</c:if>
		    	
		    	<c:if test="${empty sessionScope.loginMember }">
					<a href="loginpage.do" ><span>로그인</span></a>
					<!-- do : 개인 업체 회원가입 나누기 -->
					<a href="memberJoinMainPage.do" class="btnJoin"><span>회원가입</span></a>
				</c:if>
				</div>
		        <ul class="global_top_menu">
					<li class="navTab navTab_1"><a href="/bangbang">MAP</a></li>
					<li class="navTab navTab_2"><a href="blist.do">BANG</a></li>
					<c:url var="booklist" value="bookmarklist.do">
						<c:param name="id" value="${sessionScope.loginMember.id }"/>
					 </c:url>
					 <c:if test="${  sessionScope.loginMember.type eq '개인' && sessionScope.loginMember.id ne 'admin'}">
						<li class="navTab navTab_5"><a href="${ booklist }">ZZIM</a></li>
					</c:if>
					<c:if test="${ empty sessionScope.loginMember || sessionScope.loginMember.type eq '업체'}">
					</c:if>
					<li class="navTab navTab_6"><a href="nlist.do">NOTICE</a></li>
					<c:if test="${!empty sessionScope.loginMember && sessionScope.loginMember.id ne 'admin'}">
					 <c:url var="qnalist" value="qnalist.do">
						<c:param name="id" value="${sessionScope.loginMember.id }"/>
					 </c:url>
					<li class="navTab navTab_6"><a href="${qnalist }">QNA</a></li>
					</c:if>
					<c:if test="${empty sessionScope.loginMember }">
					<li class="navTab navTab_6"><a href="loginpage.do">QNA</a></li>
					</c:if>
		        </ul>
		        <c:if test="${ sessionScope.loginMember.id eq 'admin' }" >
				<a href="adminUserList.do" class="adminTab"><span>관리자</span></a>
				</c:if>
		    </div>
		</div>
		<script type="text/javascript">
/* 			$(function(){

				// 로그인 팝업
				$("a.btnLogin").fancybox({
					type				: 'iframe',
					href				: 'logpage.do',
					frameWidth			: 430,
					frameHeight			: 350,
					hideOnContentClick	: false
				});

				// 회원가입 팝업
				$(".btnJoin").fancybox({
					src		: '../member/memberJoin',
					type	: 'iframe',
					opts	: {
						iframe : {
							css : {
								width       : '430px',
								height      : '350px'
							}
						}
					}
				});

			}); */
		</script>
	</body>
</html>
