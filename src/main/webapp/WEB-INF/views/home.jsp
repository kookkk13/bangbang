<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<c:import url="common/header.jsp"/>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59737c5b26055785bb94a434681d2eda&libraries=services,clusterer,drawing"></script>
	</head>
	<body>
		<c:import url="common/top.jsp"/>
		<div id="map-index">
			<div id="loading-mask" style="display:none;"><img src="./resources/images/Ellipsis-1.8s-200px.svg" /></div>
		    <div id="map" class="mapConWrap" style="height:100%;">
		    	<c:import url="map/mapContainer.jsp" />
			</div>

			<div class="sideNavRight">
				<c:import url="map/mapSideBar.jsp" />
			</div>
		</div>
	</body>
</html>
