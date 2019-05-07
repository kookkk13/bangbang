<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<c:import url="./header.jsp"/>
	</head>
	<body>
		<c:import url="./top.jsp"/>
		<div id="map-index">
		    <div class="mapConWrap" style="background-image:url(./resources/images/bg_map.jpg);background-size:cover;height:100%;">
				
		    </div>
		    <div class="sideNavRight">
		    	<c:import url="../map/mapSideBar.jsp"/>
		    </div>
		    <div class="mapSpace" id="mapSpace" style="width:100%;height:100%;border-left:1px solid #ddd;"></div>
		</div>
	</body>
</html>
