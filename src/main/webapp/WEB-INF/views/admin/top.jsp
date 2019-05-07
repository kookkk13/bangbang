<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	</head>
	<body>
		<div class="adminHeader">
		    <div class="global_top">
				<h1 class="logo"><a href="">BANG GRAE</a></h1>
				<div class="myNavBox">
				<c:if test="${!empty sessionScope.admin }">
					<a href="logout.do" ><span>로그아웃</span></a>
		    	</c:if>
		    	
				</div>
		        <ul class="global_top_menu">
					<li class="navTab navTab_1"><a href="">회원 관리</a></li>
					<li class="navTab navTab_2"><a href="blist.do">업체 관리 </a></li>
					<li class="navTab navTab_5"><a href="adminblist.do">매물 관리</a></li>
					<li class="navTab navTab_6"><a href="adminNlist.do">공지 관리</a></li>
					<li class="navTab navTab_6"><a href="adminQNAlist.do">QNA 관리</a></li>
		        </ul>
				<a href="" class="adminTab"><span>관리자</span></a>
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
