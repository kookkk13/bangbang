<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta name="Title" content="">
	    <meta name="Keywords" content="">
	    <meta name="Location" content="South Korea, Seoul">
		<title>BANG BANG</title>
		<link rel="shortcut icon" sizes="32x32" href="/bangbang/resources/images/favicon.ico">
	    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css" />
	    <link rel="stylesheet" type="text/css" href="/bangbang/resources/css/reset.css" />
		<link rel="stylesheet" type="text/css" href="/bangbang/resources/package/jquery-ui-1.12.1/jquery-ui.css" />
		<link rel="stylesheet" type="text/css" href="/bangbang/resources/package/fancybox-3.0/dist/jquery.fancybox.css" />
		<link rel="stylesheet" type="text/css" href="/bangbang/resources/package/jquery-loading-master/dist/jquery.loading.css" />
	    <link rel="stylesheet" type="text/css" href="/bangbang/resources/css/style.css" />
	    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
		<link rel="stylesheet" type="text/css" href="/bangbang/resources/package/slider-pro-master/dist/css/slider-pro.css" />
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
		
	    <script src="/bangbang/resources/js/jquery-3.3.1.min.js"></script>
		<script src="/bangbang/resources/package/jquery-ui-1.12.1/jquery-ui.js"></script>
		<script src="/bangbang/resources/package/moment/moment-2.19.2.js"></script>
		<script src="/bangbang/resources/package/js-cookie-master/src/js.cookie.js"></script>
		<script src="/bangbang/resources/package/jquery-loading-master/dist/jquery.loading.js"></script>
		<script src="/bangbang/resources/package/fancybox-3.0/dist/jquery.fancybox.js"></script>
		<!-- <script src="/bangbang/resources/package/eum/common.js"></script>
		<script src="/bangbang/resources/package/eum/select.style.js"></script> -->
		<script src="/bangbang/resources/package/slider-pro-master/dist/js/jquery.sliderPro.js"></script>
	    <script type="text/javascript">
	    $.ajaxSyncPost = function(url, data, successCallback, failCallback) {
	
	      var ajaxOptions = {};
	      ajaxOptions.url = url;
	      ajaxOptions.data = JSON.stringify(data);
	      ajaxOptions.type = 'POST';
	      ajaxOptions.contentType = 'application/json';
	      ajaxOptions.dataType = 'json';
	      ajaxOptions.async = false;
	
	      if(successCallback != null) {
	        ajaxOptions.success = successCallback;
	      } else {
	        console.error("successCallback must declare.");
	      }
	
	      if(failCallback != null) {
	        ajaxOptions.error = failCallback;
	      }
	
	      $.ajax(ajaxOptions);
	    };
	
	    $.ajaxPost = function(url, data, successCallback, failCallback) {
	
	      var ajaxOptions = {};
	      ajaxOptions.url = url;
	      ajaxOptions.data = JSON.stringify(data);
	      ajaxOptions.type = 'POST';
	      ajaxOptions.contentType = 'application/json';
	      ajaxOptions.dataType = 'json';
	      ajaxOptions.async = true;
	
	      if(successCallback != null) {
	        ajaxOptions.success = successCallback;
	      } else {
	        console.error("successCallback must declare.");
	      }
	
	      if(failCallback != null) {
	        ajaxOptions.error = failCallback;
	      }
	
	      $.ajax(ajaxOptions);
	    };
	</script>
	</head>
	<body>
	<c:if test="${!empty sessionScope.loginMember}">
         <script id="embeddedChatbot" data-botId="B2py7g" src="https://www.closer.ai/js/webchat.min.js"> </script>
      </c:if>
	</body>
</html>
