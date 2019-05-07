<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	</head>
	<body>
		<div id="map"></div>
		<script>
			var map = new daum.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
		        center : new daum.maps.LatLng(37.481176, 126.952712), // 지도의 중심좌표 (서울대 입구역으로 설정)
		        level : 4 // 지도의 확대 레벨 
		    });
			
			// 줌 컨트롤러 추가
			var zoomControl = new daum.maps.ZoomControl();
			map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new daum.maps.services.Geocoder();

			// 마커 클러스터러를 생성합니다 
		    var clusterer = new daum.maps.MarkerClusterer({
		        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
		        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
		        minLevel: 1, // 클러스터 할 최소 지도 레벨 
		        calculator: [30, 50],
		        styles: [ // calculator 각 사이 값 마다 적용될 스타일을 지정한다
		            {
		                width : '60px', height : '60px',
		                background: 'rgba(89, 116, 140, .8)',
		                borderRadius: '30px',
		                color: '#fff',
		                fontSize: '15px',
		                textAlign: 'center',
		                fontWeight: 'bold',
		                lineHeight: '61px'
		            },
		            {
		                width : '70px', height : '70px',
		                background: 'rgba(89, 116, 140, .8)',
		                borderRadius: '35px',
		                color: '#fff',
		                fontSize: '15px',
		                textAlign: 'center',
		                fontWeight: 'bold',
		                lineHeight: '71px'
		            },
		            {
		                width : '80px', height : '80px',
		                background: 'rgba(89, 116, 140, .8)',
		                borderRadius: '40px',
		                color: '#fff',
		                fontSize: '15px',
		                textAlign: 'center',
		                fontWeight: 'bold',
		                lineHeight: '81px'
		            }
		        ]
		    });
		 
		    // 데이터 지도에 클러스터로 뿌리기
		   var addrArray = new Array();
		    
		    $.get("/bangbang/resources/data/address.json", function(data) {
		    	$(data.positions).map(function(i, position) {
		    		geocoder.addressSearch(position.address, function(result, status) {
		    			 if (status === daum.maps.services.Status.OK) {
		    				var coords = new daum.maps.LatLng(result[0].y, result[0].x);
		    				var markers = $(coords).map(function(i, position) {
					            return new daum.maps.Marker({
					                position : coords
					            });
						     });
		    				
		    				// 클러스터러에 마커들을 추가합니다
					        clusterer.addMarkers(markers);

		    			 }
		    			
		    		});
		    	});
		    });

		</script>
		
	</body>
</html>