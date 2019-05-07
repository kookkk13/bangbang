<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
/* 	$(function() { 
		alert("${ Bang.id }");
	});
	 */

</script>

<c:import url="../common/header.jsp" />
</head>
<body>
	<c:import url="../common/top.jsp" />
	<div id="bang-info">
		<div class="prodViewArea contentsArea">
			<div id="bang-productInfo">
				<div class="prodTitBox">
				</div>
				<div class="viewConWrap">
					<div class="contentBox imgSliderBox">
						<div id="imgSlider" class="slider-pro">
							<div class="sp-slides">
								<c:forEach items="${ bfile }" var="BangUploadFile">
									<div class="sp-slide">
									<img class="sp-image" src="${ pageContext.request.contextPath }/resources/files/bang/${ BangUploadFile.rename_file }" alt="${ BangUploadFile.rename_file}" />
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="clr"></div>
					</div>
					
					<div class="conTit">매물정보</div>
					<div class="contentBox prodInfoBox">
						<div class="infoTable left">
							<table>
								<tr>
									<th style="padding-top: 0;">주소</th>
									<td style="padding-top: 0;">${ Bang.pro_address }</td>
								</tr>
								<tr>
									<th>건물형태</th>
									<td>${ Bang.build_type }</td>
								</tr>
								<c:if test="${ Bang.con_type eq '월세'}">
									<tr>
										<th>계약형태</th>
										<td>월세</td>
									</tr>
									<tr>
										<th>가격정보</th>
										<td>
											<fmt:formatNumber value="${ Bang.deposit }" type="number" /> 만원 / ${Bang.rent} 만원
										</td>
									</tr>
								</c:if>
								<c:if test="${ Bang.con_type eq '단기임대'}">
									<tr>
										<th>계약형태</th>
										<td>단기임대</td>
									</tr>
									<tr>
										<th>가격정보</th>
										<td>
											<fmt:formatNumber value="${ Bang.deposit }" type="number" /> 만원 / ${Bang.rent} 만원
										</td>
									</tr>
								</c:if>
								<c:if test="${ Bang.con_type eq '전세' }">
									<tr>
										<th>계약형태</th>
										<td>전세</td>
									</tr>
									<tr>
										<th>가격정보</th>
										<td>
											<fmt:formatNumber value="${ Bang.deposit }"	type="number" /> 만원
										</td>
									</tr>
								</c:if>
								<c:if test="${ Bang.con_type eq '매매' }">
									<tr>
										<th>계약형태</th>
										<td>매매</td>
									</tr>
									<tr>
										<th>가격정보</th>
										<td>
											<fmt:formatNumber value="${ Bang.deposit }"	type="number" /> 만원
										</td>
									</tr>
								</c:if>

								<tr>
									<th>관리비</th>
										<c:if test="${ Bang.manage_pay ne 0}">
											<td>
											<fmt:formatNumber value="${ Bang.manage_pay }" type="number"/> 만원
											</td>
										</c:if>
										<c:if test="${ Bang.manage_pay eq 0 }">
											<td>없음</td>
										</c:if>
								</tr>
								<tr>
									<th>융자금</th>
										<c:if test="${ Bang.loan eq 0}">
											<td>없음</td>
										</c:if>
										<c:if test="${ Bang.loan ne 0}">
											<td>
												<fmt:formatNumber value="${ Bang.loan }" type="number"/> 만원
											</td>
										</c:if>
								</tr>
								<tr>
									<c:set var="today" value="<%=new java.util.Date()%>" />
										<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="today"/>
									<th>입주가능일</th>
									<c:if test="${ !empty Bang.move_date }">
										<c:if test="${ Bang.move_date < today }">
											<td>즉시입주</td>
										</c:if>
										<c:if test="${ Bang.move_date >= today }">
											<td>${ Bang.move_date }</td>
										</c:if>
									</c:if>
									<c:if test="${ empty Bang.move_date }">
										<td>즉시입주</td>
									</c:if>
								</tr>
							</table>
						</div>
						<div class="infoTable right">
							<table>
								<tr>
									<th style="padding-top: 0;">방 개수</th>
									<td style="padding-top: 0;">${ Bang.room_count }개</td>
								</tr>
								<tr>
									<th>욕실개수</th>
									<td>${ Bang.bath_count }개</td>
								</tr>
								<tr>
									<th>공급/전용면적</th>
									<td>${ Bang.supply_area}㎡ (<fmt:formatNumber value="${ Bang.supply_area * 0.3}" />)평<br>
										${ Bang.real_area }㎡ (<fmt:formatNumber value="${ Bang.real_area * 0.3}" />)평
									</td>
								</tr>
								<tr>
									<th>해당층</th>
									<c:if test="${ Bang.floor > 0}">
										<td>${ Bang.floor } 층</td>
									</c:if>
									<c:if test="${ Bang.floor < 0}">
										<td>지하 ${fn:substring( Bang.floor,1,2)} 층 </td>
									</c:if>
									
								</tr>
								<tr>
									<th>방 거실 형태</th>
									<td>${ Bang.room_type }</td>
								</tr>
								<tr>
									<th>방향</th>
									<td>${ Bang.direction }</td>
								</tr>
								<tr>
									<th>현관 유형</th>
									<td>${ Bang.door_type }</td>
								</tr>
								<tr>
									<th>준공년월</th>
									<c:if test="${ !empty Bang.build_date }">
										<td>${ Bang.build_date }</td>
									</c:if>
									<c:if test="${ empty Bang.build_date }">
										<td>확인불가</td>
									</c:if>
								</tr>
							</table>
						</div>
						<div class="clr"></div>
					</div>

					<!-- Res옵션정보 꺼내기 -->
				   <c:forEach items="${ res }" var="ResOption">
				   <c:choose >
						<c:when test="${ ResOption.res_no eq 1}">
							<c:set var="res1" value="${ ResOption.res_pro_con }"/>
						</c:when>
						<c:when test="${ ResOption.res_no eq 2}">
							<c:set var="res2" value="${ ResOption.res_pro_con }" />
						</c:when>
						<c:when test="${ ResOption.res_no eq 3}">
							<c:set var="res3" value="${ ResOption.res_pro_con }" />
						</c:when>
						<c:when test="${ ResOption.res_no eq 4}">
							<c:set var="res4" value="${ ResOption.res_pro_con }" />
						</c:when>
						<c:when test="${ ResOption.res_no eq 5}">
							<c:set var="res5" value="${ ResOption.res_pro_con }" />
						</c:when>
						<c:when test="${ ResOption.res_no eq 6}">
							<c:set var="res6" value="${ ResOption.res_pro_con }" />
						</c:when>
						<c:when test="${ ResOption.res_no eq 7}">
							<c:set var="res7" value="${ ResOption.res_pro_con }" />
						</c:when>
						<c:when test="${ ResOption.res_no eq 8}">
							<c:set var="res8" value="${ ResOption.res_pro_con }" />
						</c:when>
						<c:when test="${ ResOption.res_no eq 9}">
							<c:set var="res9" value="${ ResOption.res_pro_con }" />
						</c:when>
						<c:when test="${ ResOption.res_no eq 10}">
							<c:set var="res10" value="${ ResOption.res_pro_con }" />
						</c:when>
						<c:when test="${ ResOption.res_no eq 11}">
							<c:set var="res11" value="${ ResOption.res_pro_con }" />
						</c:when>
						<c:when test="${ ResOption.res_no eq 12}">
							<c:set var="res12" value="${ ResOption.res_pro_con }" />
						</c:when>
						<c:when test="${ ResOption.res_no eq 13}">
							<c:set var="res13" value="${ ResOption.res_pro_con }" />
						</c:when>
						<c:when test="${ ResOption.res_no eq 14}">
							<c:set var="res14" value="${ ResOption.res_pro_con }" />
						</c:when>
					</c:choose>
					</c:forEach>
					
					<!--  live 옵션정보 꺼내기 -->
					<c:forEach items="${ live }" var="liveOption">
					<c:choose >
						<c:when test="${ liveOption.live_no eq 1}">
							<c:set var="live1" value="${ liveOption.live_pro_con }"/>
						</c:when>
						<c:when test="${ liveOption.live_no eq 2}">
							<c:set var="live2" value="${ liveOption.live_pro_con }" />
						</c:when>
						<c:when test="${ liveOption.live_no eq 3}">
							<c:set var="live3" value="${ liveOption.live_pro_con }" />
						</c:when>
						<c:when test="${ liveOption.live_no eq 4}">
							<c:set var="live4" value="${ liveOption.live_pro_con }" />
						</c:when>
						<c:when test="${ liveOption.live_no eq 5}">
							<c:set var="live5" value="${ liveOption.live_pro_con }" />
						</c:when>
						<c:when test="${ liveOption.live_no eq 6}">
							<c:set var="live6" value="${ liveOption.live_pro_con }" />
						</c:when>
						<c:when test="${ liveOption.live_no eq 7}">
							<c:set var="live7" value="${ liveOption.live_pro_con }" />
						</c:when>
						<c:when test="${ liveOption.live_no eq 8}">
							<c:set var="live8" value="${ liveOption.live_pro_con }" />
						</c:when>
						<c:when test="${ liveOption.live_no eq 9}">
							<c:set var="live9" value="${ liveOption.live_pro_con }" />
						</c:when>
						<c:when test="${ liveOption.live_no eq 10}">
							<c:set var="live10" value="${ liveOption.live_pro_con }" />
						</c:when>
						<c:when test="${ liveOption.live_no eq 11}">
							<c:set var="live11" value="${ liveOption.live_pro_con }" />
						</c:when>
						<c:when test="${ liveOption.live_no eq 12}">
							<c:set var="live12" value="${ liveOption.live_pro_con }" />
						</c:when>
						<c:when test="${ liveOption.live_no eq 13}">
							<c:set var="live13" value="${ liveOption.live_pro_con }" />
						</c:when>
						<c:when test="${ liveOption.live_no eq 14}">
							<c:set var="live14" value="${ liveOption.live_pro_con }" />
						</c:when>
						<c:when test="${ liveOption.live_no eq 15}">
							<c:set var="live15" value="${ liveOption.live_pro_con }" />
						</c:when>
					</c:choose>
					</c:forEach>
					
					<div class="conTit">추가옵션</div>
					<div class="contentBox prodOptBox">
						<ul>
							<li>
								<c:set var="buildDate" value="${ Bang.build_date }"/>
								<jsp:useBean id="today1" class="java.util.Date"/>
								<fmt:formatDate value="${ today1 }" type="date" var="todate"/>
								<fmt:parseNumber var="now" value="${ today1.time / (1000*60*60*24) }" integerOnly="true"/>
								<fmt:parseNumber var="build" value="${ buildDate.time / (1000*60*60*24) }" integerOnly="true"/>
								<!-- 신축여부 -->
								<c:if test="${ !empty Bang.build_date }">
									<c:if test="${ now - build < 720 }">
										<img src="${ pageContext.request.contextPath }/resources/images/detail_new.png" id="roomOptImg" />
									</c:if>
									<c:if test="${ now - build >= 720 }">
										<img src="${ pageContext.request.contextPath }/resources/images/detail_new_x.png" id="roomOptImg" />
									</c:if>
								</c:if>
								<c:if test="${ empty  Bang.build_date}">
									<img src="${ pageContext.request.contextPath }/resources/images/detail_new_x.png" id="roomOptImg" />
								</c:if>
							</li>
							<li>
								<!--  풀옵션여부 -->
								<c:if test="${ live.size() >= 10}">
									<img src="${ pageContext.request.contextPath }/resources/images/detail_full.png" id="roomOptImg" />
								</c:if>
								<c:if test="${ live.size() < 10}">
									<img src="${ pageContext.request.contextPath }/resources/images/detail_full_x.png" id="roomOptImg" />
								</c:if>
							</li>
							<li>
								<!-- 주차가능여부 -->
								<c:if test="${ empty res1 }">
									<img src="${ pageContext.request.contextPath }/resources/images/detail_park_x.png" id="roomOptImg" />
								</c:if>
								<c:if test="${ !empty res1 }">
									<img src="${ pageContext.request.contextPath }/resources/images/detail_park.png" id="roomOptImg" />
								</c:if>
							</li>
							<li>
								<!--  엘리베이터여부 -->
								<c:if test="${ empty res2 }">
									<img src="${ pageContext.request.contextPath }/resources/images/detail_ev_x.png" id="roomOptImg" />
								</c:if>
								<c:if test="${ !empty res2 }">
									<img src="${ pageContext.request.contextPath }/resources/images/detail_ev.png" id="roomOptImg" />
								</c:if>
							</li>
							<li>
								<!-- 반려동물여부 -->
								<c:if test="${ !empty res3 }">
									<img src="${ pageContext.request.contextPath }/resources/images/detail_animal.png" id="roomOptImg" />
								</c:if>
								<c:if test="${ empty res3 }">
									<img src="${ pageContext.request.contextPath }/resources/images/detail_animal_x.png" id="roomOptImg" />
								</c:if>
							</li>
							<li>
								<!--  전세대출여부 -->
								
								<c:if test="${ !empty res4 }">
								<img src="${ pageContext.request.contextPath }/resources/images/detail_loan.png" id="roomOptImg" />
								</c:if>
								<c:if test="${ empty res4 }">
								<img src="${ pageContext.request.contextPath }/resources/images/detail_loan_x.png" id="roomOptImg" />
								</c:if>
							</li>
							<li>
								<!--  큰길가여부 -->
								<c:if test="${ !empty res5 }">
									<img src="${ pageContext.request.contextPath }/resources/images/detail_road.png" id="roomOptImg" />
								</c:if>
								<c:if test="${ empty res5 }">
									<img src="${ pageContext.request.contextPath }/resources/images/detail_road_x.png" id="roomOptImg" />
								</c:if>
							</li>
						</ul>
					</div>

					<div class="conTit">시설정보</div>
					<div class="contentBox prodInfoBox">
						<div class="infoTable left">
							<table>
								<tr>
									<th style="padding-top: 0;">난방방식</th>
									<c:if test="${ !empty res9 }">
										<td style="padding-top: 0;">${ res9 }</td>
									</c:if>
									<c:if test="${ empty res9 }">
										<td style="padding-top: 0;">중앙난방</td>
									</c:if>
								</tr>
								<tr>
									<th>생활시설</th>
									<td>
										<c:if test="${ !empty live2 }">${ live2 }&nbsp;</c:if>
										<c:if test="${ !empty live3 }">${ live3 }&nbsp;</c:if>
										<c:if test="${ !empty live4 }">${ live4 }&nbsp;</c:if>
										<c:if test="${ !empty live5 }">${ live5 }&nbsp;</c:if>
										<br>
										<c:if test="${ !empty live6 }">${ live6 }&nbsp;</c:if>
										<c:if test="${ !empty live7 }">${ live7 }&nbsp;</c:if>
										<c:if test="${ !empty live8 }">${ live8 }&nbsp;</c:if>
										<c:if test="${ !empty live9 }">${ live9 }&nbsp;</c:if>
										<c:if test="${ !empty live10 }">${ live10 }&nbsp;</c:if>
										<br>
										<c:if test="${ !empty live11 }">${ live11 }&nbsp;</c:if>
										<c:if test="${ !empty live12 }">${ live12 }&nbsp;</c:if>
										<c:if test="${ !empty live13 }">${ live13 }&nbsp;</c:if>
										<c:if test="${ !empty live14 }">${ live14 }&nbsp;</c:if>
										<c:if test="${ !empty live15 }">${ live15 }&nbsp;</c:if>
										
									</td>
								</tr>
								<tr>
									<th>기타시설</th><!--  베란다, 소화기 -->
									<td>
										<c:if test="${ !empty res8 }">${ res8 }&nbsp;</c:if>
										<c:if test="${ !empty res13 }">${ res13 }&nbsp;</c:if>
									</td>
								</tr>
							</table>
						</div>
						<div class="infoTable right">
							<table>
								<tr>
									<th style="padding-top: 0;">냉방시설</th>
									<td style="padding-top: 0;"><c:if test="${ !empty live1 }">${ live1 }&nbsp;</c:if></td>
								</tr>
								<tr>
									<th>보안시설</th>
									<td>
										<c:if test="${ !empty res6 }">${ res6 }&nbsp;</c:if>
										<c:if test="${ !empty res7 }">${ res7 }&nbsp;</c:if>
										<c:if test="${ !empty res10 }">${ res10 }&nbsp;</c:if>
										<br>
										<c:if test="${ !empty res11 }">${ res11 }&nbsp;</c:if>
										<c:if test="${ !empty res12 }">${ res12 }&nbsp;</c:if>
										<c:if test="${ !empty res14 }">${ res14 }&nbsp;</c:if>
									</td>
								</tr>
							</table>
						</div>
						<div class="clr"></div>
					</div>
					<div class="conTit">상세정보</div>
					<div class="contentBox infoBox">${ Bang.pro_content }</div>
					<div class="conTit">위치정보</div>
					<!--  카카오맵 지도  -->
					<!-- services 라이브러리 불러오기(장소검색 / 주소-좌표 변환) -->
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5c60887e0ed245519b063ce242301a62&libraries=services,clusterer,drawing"></script>
					<!--  지도 라이브러리 -->
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5c60887e0ed245519b063ce242301a62"></script>
					
					<div id="map" style="width:814px;height:510px;"></div>
					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						    mapOption = {
						        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						        level: 2 // 지도의 확대 레벨
						    };  
						// 지도를 생성합니다    
						var map = new daum.maps.Map(mapContainer, mapOption); 
						
						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new daum.maps.services.Geocoder();
						
						// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
						var mapTypeControl = new daum.maps.MapTypeControl();

						// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
						// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
						map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

						// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
						var zoomControl = new daum.maps.ZoomControl();
						map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
						
						// 주소로 좌표를 검색합니다
						geocoder.addressSearch('${ Bang.pro_address }', function(result, status) {
						
						    // 정상적으로 검색이 완료됐으면 
						     if (status === daum.maps.services.Status.OK) {
						
						        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
						
						        // 결과값으로 받은 위치를 마커로 표시합니다
						        var marker = new daum.maps.Marker({
						            map: map,
						            position: coords
						        });
						
						        // 인포윈도우로 장소에 대한 설명을 표시합니다
						        /* var infowindow = new daum.maps.InfoWindow({
						            content: '<div style="width:150px;text-align:center;padding:6px 0;">매물위치</div>'
						        });
						        infowindow.open(map, marker); */
						
						        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						        map.setCenter(coords);
						    } 
						});
						
					</script>

					<div class="viewSideNav">
						<ul>
							<li class="sideBox sideBox1">
								<div class="bangNum">
									<span class="icon">매물번호</span> <strong class="num">${ Bang.pro_no }</strong>
								</div>
								<div class="likeBox">
									<c:if test="${loginMember ne null }" >
										<c:if test="${ sessionScope.loginMember.type eq '개인' }">
											<c:if test="${ loginMember.id ne Bang.id }">
									<script type="text/javascript">
										function addBookmark(){
										$.ajax({
											url: "addBookmark.do",
											type: "post",
											data: {pro_no: "${ Bang.pro_no }", com_id: "${ Bang.id}" },
											success: function(data){
												$("#aLike").css("display","none");
												$("#dLike").css("display","");
												if(data == "ok"){
													alert("찜하기 완료");
												}else if (data=="redo"){
													alert("이미 찜하기 완료된 매물입니다");
												}else{
													alert("찜하기 실패");
												}
											},
											error: function(jqXHR, textstatus, errorthrown){
												console.log("error : " + jqXHR + ", " + textstatus
														+ ", " + errorthrown);
												}	
										});
										}
										
										function delBookmark(){
											$.ajax({
												url: "delBookmark.do",
												type: "post",
												data: {pro_no: "${ Bang.pro_no }", com_id: "${ Bang.id}" },
												success: function(data){
													$("#dLike").css("display","none");
													$("#aLike").css("display","");
													if(data == "ok"){
														alert("찜하기 삭제 완료");
													}else if (data=="redo"){
														alert("등록되어있지 않습니다.");
													}else{
														alert("찜하기 삭제 실패");
													}
												},
												error: function(jqXHR, textstatus, errorthrown){
													console.log("error : " + jqXHR + ", " + textstatus
															+ ", " + errorthrown);
													}	
											});
											}
									</script>
												<a href="javascript:void(0);" onclick="addBookmark();" id="aLike" name="aLike" 
												class="btnLike trans-300"<c:if test="${ bcheck eq 1 }"> style="display:none" </c:if>><span>찜하기</span></a>
												<a href="javascript:void(0);" onclick="delBookmark();" id="dLike" name="dLike" 
												class="btnLike trans-300" <c:if test="${ bcheck ne 1 }"> style="display:none" </c:if>><span>찜삭제</span></a>
												<c:if test="${ userType ne 'usermy' }">
												<c:if test="${ schedulerCheck ne 1 }">
												<c:if test="${ !empty company }">
		                                	 		<a href="companySchedulerPage.do?id=${ Bang.id }&no=${ Bang.pro_no }" class="btnLike trans-300"><span style="margin-left: 14px;">방문 예약</span></a>
				                             	 </c:if>
					                              <c:if test="${ !empty user }">
					                                 <a href="userSchedulerPage.do?id=${ Bang.id }&no=${ Bang.pro_no }" class="btnLike trans-300"><span style="margin-left: 14px;">방문 예약</span></a>
					                              </c:if>
					                             </c:if>
					                              </c:if>
					                              </c:if>
										</c:if>
		                              </c:if>
								</div>
							</li>
							<li class="sideBox sideBox2">
								<div class="bangInfo1">
									<c:if test="${ Bang.con_type eq '월세'}">
										<span class="p_Way p_Way_a">월세</span>
											<br><br>
											<strong class="price">
												<fmt:formatNumber value="${ Bang.deposit }" type="number" /> 만원 / ${Bang.rent} 만원</strong>
									</c:if>
									<c:if test="${ Bang.con_type eq '단기임대'}">
										<span class="p_Way p_Way_c">단기임대</span>
										<br><br>
											<strong class="price">
												<fmt:formatNumber value="${ Bang.deposit }" type="number" /> 만원 / ${Bang.rent} 만원</strong>
									</c:if>
									<c:if test="${ Bang.con_type eq '전세' }">
										<span class="p_Way p_Way_b">전세</span>
										<br><br>
											<strong class="price">
												<fmt:formatNumber value="${ Bang.deposit }" type="number" /> 만원</strong>
									</c:if>
									<c:if test="${ Bang.con_type eq '매매' }">
										<span class="p_Way p_Way_d">매매</span>
										<br><br>
											<strong class="price">
												<fmt:formatNumber value="${ Bang.deposit }" type="number" /> 만원</strong>
									</c:if>
								</div>
								<p class="bangAddr">${ Bang.pro_address }</p>
							</li>
							<c:if test="${ !empty company }">
							<li class="sideBox sideBox3">
								<p class="comInfo1">${ company.com_content }</p>
								<p class="comInfo2">${ company.com_name }</p>
								<br>
								<c:if test="${ !empty loginMember  }">
									<p class="comCall">${ company.com_phone }</p>
								</c:if>
								<c:if test="${ empty loginMember }">
									<p class="comCall"> 연락처는 로그인 후 열람가능합니다. </p>
								</c:if>
							</li>
							<li class="sideBox sideBox4">
								<p class="sendTit">
										<strong>업체위치</strong>
									</p>
								<div class="sendBox sendBox2" id="map2" style="height:300px;">
									<script>
										var mapContainer2 = document.getElementById('map2'), 
										    mapOption2 = {
										        center: new daum.maps.LatLng(33.450701, 126.570667),
										        level: 2
										    };  
										var map2 = new daum.maps.Map(mapContainer2, mapOption2); 
										var geocoder2 = new daum.maps.services.Geocoder();
										var mapTypeControl2 = new daum.maps.MapTypeControl();
										map2.addControl(mapTypeControl2, daum.maps.ControlPosition.TOPRIGHT);
										var zoomControl2 = new daum.maps.ZoomControl();
										map2.addControl(zoomControl2, daum.maps.ControlPosition.RIGHT);
										geocoder2.addressSearch('${ company.brokers_address }', function(result2, status2) {
										
										     if (status2 === daum.maps.services.Status.OK) {
										        var coords2 = new daum.maps.LatLng(result2[0].y, result2[0].x);
										        var marker2 = new daum.maps.Marker({
										            map: map2,
										            position: coords2
										        });
										        map2.setCenter(coords2);
										    } 
										});
										</script>
								</div>
							</li>
							</c:if>
							<c:if test="${ !empty user }">
							<li class="sideBox sideBox3">
								<p class="comInfo1">연락시 BANG BANG에서 보고 연락했다고 말씀하시면 더욱 빠르게 상담 받을 수 있습니다.</p>
								<p class="comInfo2">${ user.user_name }</p>
								<br>
								<c:if test="${ !empty loginMember  }">
								<p class="comCall">${ user.user_phone }</p>
								</c:if>
								<c:if test="${ empty loginMember }">
									<p class="comCall"> 연락처는 로그인 후 열람가능합니다. </p>
								</c:if>
							</li>
							</c:if>
						<c:url var="bupView" value="bupdateView.do">
							<c:param name="pro_no" value="${ Bang.pro_no }"/>
							<c:param name="id" value="${ Bang.id }"/>
							<c:param name="userType" value="${ userType }"/>
						</c:url>
						<c:url var="bdel" value="bdelete.do">
							<c:param name="pro_no" value="${ Bang.pro_no }"/>
						</c:url>
						<c:if test="${ !empty sessionScope.loginMember.id }">
						<c:if test="${ Bang.pro_del ne 'Y' }">
							<c:if test="${ sessionScope.loginMember.id eq user.user_id or sessionScope.loginMember.id eq 
							company.com_id or sessionScope.loginMember.id eq 'admin'}">
							<a href="${ bupView }" class="btnModify"><span>상세 페이지 수정</span></a>
							
							<a href="${ bdel }" class="btnModify"><span>매물 삭제</span></a>
							</c:if>
						</c:if>
						<c:if test="${ Bang.pro_del eq 'Y' }">
							<a  class="btnDelNoti" ><span>삭제된 게시글입니다.</span></a>
						</c:if>
						</c:if>
						
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
	$(function() {
		if ($('#imgSlider').find('.sp-slide').length > 0) {
			$('#imgSlider').sliderPro({
				width : 960,
				height : 500,
				fade : true,
				arrows : true,
				buttons : true,
				fullScreen : true,
				shuffle : true,
				smallSize : 500,
				mediumSize : 1000,
				largeSize : 3000,
				thumbnailTouchSwipe : true,
				autoplay : false
				});
			}
		});
</script>


</body>
</html>