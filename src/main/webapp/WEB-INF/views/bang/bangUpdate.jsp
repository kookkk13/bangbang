<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../common/header.jsp" />
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	//수정페이지 로딩시 체크값확인후 비활성화셋팅
	//준공일자
	$(function(){
		if($("#build_date_n").is(":checked")){
			//console.log("준공일자 확인불가 체크됨");
			$("#build_date").attr("disabled", true);
		} else {
			$("#build_date").attr("disabled", false);
		}
	});
	//입주일자
	$(function(){
		if($("#move_date_n").is(":checked")){
			//console.log("입주일자 즉시 체크됨");
			$("#move_date").attr("disabled", true);
		} else {
			$("#move_date").attr("disabled", false);
		}
	});
	//관리비
	$(function(){
		if($("#manage_pay_n").is(":checked")){
			//console.log("관리비 없음 체크됨");
			$("#manage_pay").attr("disabled", true);
		} else {
			$("#manage_pay").attr("disabled", false);
		}
	});
	//융자금
	$(function(){
		if($("#loan_n").is(":checked")){
			//console.log("융자금 없음 체크됨");
			$("#loan").attr("disabled", true);
		} else {
			$("#loan").attr("disabled", false);
		}
	});
	//월세
	$(function(){
		if($("#contract_type_3").is(":checked")){
			console.log("전세 체크됨");
			$("#rent").attr("disabled", true);
		} else if ($("#contract_type_4").is(":checked")){
			console.log("매매 체크됨");
			$("#rent").attr("disabled", true);
		} else {
			console.log("월세,단기매매 체크됨");
			$("#rent").attr("disabled", false);
		}
	});
</script>
<script type="text/javascript">
	//준공년월 입력란 비활성화
	function check_build_date(form) {
		if (form.build_date.disabled == false) {
			form.build_date.disabled = true
		} else {
			form.build_date.disabled = false
		}
	}
	
	//입주가능일 입력란 비활성화
	function check_move_date(form) {
		if (form.move_date.disabled == true) {
			form.move_date.disabled = false
		} else {
			form.move_date.disabled = true
		}
	}
	//관리비 입력란 비활성화
	function check_manage_pay(form) {
		if (form.manage_pay.disabled == true) {
			form.manage_pay.disabled = false
		} else {
			form.manage_pay.disabled = true
		}
	}
	
	//융자금 입력란 비활성화
	function check_loan(form) {
		if (form.loan.disabled == true) {
			form.loan.disabled = false
		} else {
			form.loan.disabled = true
		}
	}
	//생활옵션 주거옵션 1개이상 필수체크검사 
	function CheckForm(Join){
	    var liveCheck = false;
	    var arr_live = document.getElementsByName("living_option");
	    for(var i=0;i<arr_live.length;i++){
	        if(arr_live[i].checked == true) {
	        	liveCheck = true;
	            break;
	        }
	    }
	    if(!liveCheck){
	        alert("생활옵션중 하나를 반드시 선택해주세요");
	        return false;
	    }
	
	    var resCheck = false;
	    var arr_res = document.getElementsByName("res_option");
	    for(var i=0;i<arr_res.length;i++){
	        if(arr_res[i].checked == true) {
	        	resCheck = true;
	            break;
	        }
	    }
	    if(!resCheck){
	        alert("시설옵션 중 하나를 반드시 선택해주세요");
	        return false;
	    }
	}
</script>
</head>
<body>
	<c:import url="../common/top.jsp" />
	<div id="bang-write">
		<div class="prodRegistArea">
			<div class="registWrap">
				<h3 class="registTit">매물 수정하기</h3>
				<h4> 작성자 :  ${ sessionScope.loginMember.id }</h4>
				<h4> ${ userType }</h4>
				<c:url var="upBang" value="upBang.do">
					<c:param name="pro_no" value="${ Bang.pro_no }"/>
					<c:param name="id" value="${ sessionScope.loginMember.id }"/>
					<c:param name="userType" value="${ userType }"/>
				</c:url>
				<div class="registConBox">
					<form name="writeForm" id="writeForm" action="${ upBang }" onSubmit="return CheckForm(this)" method="post" enctype="multipart/form-data">
						<input type="hidden" name="id" value="${ sessionScope.loginMember.id }"/>
						<div class="tableTit">매물 기본정보</div>
						<table class="writeTable">
							<tr>
								<th>건물 형태 ${ Bang.build_type }</th>
								<td colspan="3">
									<div class="select">
										<select style="width: 180px;" name="build_type" required>
											<option value="오피스텔" <c:if test="${ Bang.build_type eq '오피스텔' }">selected</c:if>>오피스텔</option>
											<option value="원룸"<c:if test="${ Bang.build_type eq '원룸' }">selected</c:if>>원룸</option>
											<option value="빌라"<c:if test="${ Bang.build_type eq '빌라' }">selected</c:if>>빌라</option>
											<option value="아파트"<c:if test="${ Bang.build_type eq '아파트' }">selected</c:if>>아파트</option>
											<option value="주택"<c:if test="${ Bang.build_type eq '주택' }">selected</c:if>>주택</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<th>매물 소재지</th>
								<td colspan="3">
									<div class="form-group">
										<br>
											<input type="text" name="pro_address" style="width: 300px; height: 30px;" readonly class="form-control" style="clear:left;" value="${ Bang.pro_address }"/>
										<br>
											<input type="text" name="pro_detail" id="detailadd" readonly style="width: 300px; height: 30px;" class="form-control" style="clear:left;" value="${ Bang.pro_detail }" />
									</div>
								</td>
							</tr>
							<tr>
								<th>방 개수</th>
								<td>
									<input type="number" name="room_count" style="width: 80px;" min="1" max="10" step="1" required value="${ Bang.room_count }"/>
										<span class="l-mark">개</span>
								</td>
								<th>욕실 개수</th>
								<td>
									<input type="number" name="bath_count" style="width: 80px;" min="1" max="10" step="1" required value="${ Bang.bath_count }"/>
										<span class="l-mark">개</span>
								</td>
							</tr>
							<tr>
								<th rowspan="2">층수</th>
								<td rowspan="2">
									<span class="f-mark">해당 층수</span>
										<input type="number" style="width: 80px;" placeholder="층입력" name="floor" min="-1" max="50" step="1" required value="${ Bang.floor }"/>
											&nbsp; <span class="l-mark">지하일경우 -(층)</span>
								</td>
								<th rowspan="2">평수</th>
								<td>
									<span class="f-mark">공급면적</span>
										<input type="number" style="width: 80px;" placeholder="면적 입력" name="supply_area" min="1" required value="${ Bang.supply_area }"/>
											<span class="l-mark">㎡</span>
								</td>
							</tr>
							<tr>
								<td>
									<span class="f-mark">전용면적</span>
										<input type="number" style="width: 80px;" placeholder="면적 입력" name="real_area" min="1" required value="${ Bang.real_area }"/>
											<span class="l-mark">㎡</span>
								</td>
							</tr>
							<tr>
								<th>방향</th>
								<td colspan="3">
									<span>
										<input type="radio" name="direction" id="room_direction_type_e" value="동"<c:if test="${ Bang.direction eq '동' }">checked</c:if> required/>
											<label for="room_direction_type_e"> 동</label>
									</span>
									<span>
										<input type="radio" name="direction" id="room_direction_type_w" value="서"<c:if test="${ Bang.direction eq '서' }">checked</c:if>/>
											<label for="room_direction_type_w"> 서</label>
									</span>
									<span>
										<input type="radio" name="direction"id="room_direction_type_s" value="남"<c:if test="${ Bang.direction eq '남' }">checked</c:if>/>
											<label for="room_direction_type_s"> 남</label>
									</span>
									<span>
										<input type="radio" name="direction" id="room_direction_type_n" value="북" <c:if test="${ Bang.direction eq '북' }">checked</c:if> />
											<label for="room_direction_type_n"> 북</label>
									</span>
									<span>
										<input type="radio" name="direction" id="room_direction_type_se" value="남동" <c:if test="${ Bang.direction eq '남동' }">checked</c:if> />
											<label for="room_direction_type_se"> 남동</label>
									</span>
									<span>
										<input type="radio" name="direction" id="room_direction_type_sw" value="남서" <c:if test="${ Bang.direction eq '남서' }">checked</c:if> />
											<label for="room_direction_type_sw"> 남서</label>
									</span>
									<span>
										<input type="radio" name="direction" id="room_direction_type_nw" value="북서" <c:if test="${ Bang.direction eq '북서' }">checked</c:if> />
											<label for="room_direction_type_nw"> 북서</label>
									</span>
									<span>
										<input type="radio" name="direction" id="room_direction_type_ne" value="북동" <c:if test="${ Bang.direction eq '북동' }">checked</c:if> />
											<label for="room_direction_type_ne"> 북동</label>
									</span>
								</td>
							</tr>
							<tr>
								<th>방 거실형태</th>
								<td colspan="3">
									<span>
										<input type="radio" name="room_type" id="dinning_room_type_o" value="오픈형" <c:if test="${ Bang.room_type eq '오픈형' }">checked</c:if> required/>
											<label for="dinning_room_type_o"> 오픈형</label>
									</span>
									<span>
										<input type="radio" name="room_type" id="dinning_room_type_s" value="분리형" <c:if test="${ Bang.room_type eq '분리형' }">checked</c:if> />
											<label for="dinning_room_type_s"> 분리형</label>
									</span>
								</td>
							</tr>
							<tr>
								<th>현관유형</th>
								<td colspan="3">
								 
									<span>
										<input type="radio" name="door_type" id="door_type_1" value="복도식" required <c:if test="${ Bang.door_type eq '복도식' }">checked</c:if> />
											<label for="door_type_1">복도식</label>
									</span>
									<span>
										<input type="radio" name="door_type" id="door_type_2" value="계단식" <c:if test="${ Bang.door_type eq '계단식' }">checked</c:if> />
											<label for="door_type_2"> 계단식</label>
									</span>
									<span>
										<input type="radio" name="door_type" id="door_type_3" value="복합식" <c:if test="${ Bang.door_type eq '복합식' }">checked</c:if>/>
											<label for="door_type_3"> 복합식</label>
									</span>
								</td>
							</tr>
							
							<tr>
								<th>준공년월</th>
								<td colspan="3">
								
									<span>
										<input type="date" name="build_date" id="build_date" required <c:if test="${ !empty Bang.build_date }">value="${ Bang.build_date }"</c:if>/>
											<label for="build_date"></label>
									</span>
									<span>
										<input type="checkbox" id="build_date_n" onClick="check_build_date(this.form)" value=""<c:if test="${ empty Bang.build_date }">checked</c:if>/>
											<label for="build_date_n">확인불가</label>
									</span>
								</td>
							</tr>
							<tr> 
								<th>입주가능일</th>
								<td colspan="3">
								 
									<span>
										<input type="date" name="move_date" id="move_date" required <c:if test="${ !empty Bang.move_date }">value="${ Bang.move_date }"</c:if>/>
											<label for="move_date"></label>
									</span>
									<span>
										<input type="checkbox" id="move_date_n" onClick="check_move_date(this.form)" <c:if test="${ empty Bang.move_date }">checked</c:if>/>
											<label for="move_date_n">즉시입주가능</label>
									</span>
								
								 
								</td>
							</tr>
						</table>
						<script type="text/javascript">
								//월세입력란 활성화/비활성화
								 $(function(){
								    $("input:radio[name=con_type]").click(function(){
								        if($("input:radio[name=con_type]:checked").val() == "월세"){
								            $("input:text[name=rent]").attr("disabled",false);
								        }else if($("input:radio[name=con_type]:checked").val() == "단기임대"){
								        	$("input:text[name=rent]").attr("disabled",false);
								        }else {
								        	$("input:text[name=rent]").attr("disabled",true);
								        }
								    });
								});
							</script>
						<div class="tableTit">매물 거래정보</div>
						<table class="writeTable">
							<tr>
								<th>계약형태</th>
								<td colspan="3">
									<span>
										<input type="radio" name="con_type" id="contract_type_1" value="월세" required  <c:if test="${ Bang.con_type eq '월세' }">checked</c:if>/>
											<label for="contract_type_1"> 월세</label>
									</span>
									<span>
										<input type="radio" name="con_type" id="contract_type_2" value="단기임대" <c:if test="${ Bang.con_type eq '단기임대' }">checked</c:if>/>
											<label for="contract_type_2"> 단기임대</label>
									</span>
									<span>
										<input type="radio" name="con_type" id="contract_type_3" value="전세" <c:if test="${ Bang.con_type eq '전세' }">checked</c:if>/>
											<label for="contract_type_3"> 전세</label>
									</span>
									<span>
										<input type="radio" name="con_type" id="contract_type_4" value="매매" <c:if test="${ Bang.con_type eq '매매' }">checked</c:if>/>
											<label for="contract_type_4"> 매매</label>
									</span>
								</td>
							</tr>
							<tr>
								<th>가격정보</th>
								<td colspan="3">
									
									<span class="f-mark">보증금(매매금)</span>
										<input type="number" style="width: 80px;" name="deposit" min="1" required <c:if test="${ !empty Bang.deposit }">value="${ Bang.deposit }"</c:if>/>
											<span class="l-mark">만원</span>
									
									<span class="f-mark">월세</span>
										<input type="text" name="rent" id="rent" style="width: 80px;" min="1" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required 
											<c:if test="${ Bang.rent ne 0 }">value="${ Bang.rent }"</c:if>
											<c:if test="${ Bang.rent eq 0 }"></c:if> />
									<span class="l-mark">만원</span>
									
								</td>
							</tr>
							<tr>
								<th>관리비</th>
								<td colspan="3">
									<span class="f-mark">관리비</span>
										<input type="number" style="width: 80px;" id="manage_pay" name="manage_pay" min="1" required <c:if test="${ Bang.manage_pay ne 0 }">value="${ Bang.manage_pay }"</c:if>/>
											<span class="l-mark">만원</span>
									<br>
									<span style="display: inline-block; margin-top: 10px;">
										<input type="checkbox" id="manage_pay_n" onClick="check_manage_pay(this.form)" <c:if test="${ Bang.manage_pay eq 0 }">checked</c:if>/>
											<label for="manage_pay_n">없음</label>
									</span>
								</td>
							</tr>
							
							<tr>
								<th>융자금</th>
								<td colspan="3">
									<span class="f-mark">융자금액</span>
										<input type="number" style="width: 80px;" id="loan" name="loan" min="1" required <c:if test="${ Bang.loan ne 0 }">value="${ Bang.loan }"</c:if>/>
											<span class="l-mark">만원</span>
									<br>
									<span style="display: inline-block; margin-top: 10px;">
										<input type="checkbox" id="loan_n" onClick="check_loan(this.form)" <c:if test="${ Bang.loan eq 0 }">checked</c:if>/>
											<label for="loan_n">없음</label>
									</span>
								</td>
							</tr>
						</table>
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
					
						<div class="tableTit">시설 옵션</div>
						<table class="writeTable">
							<tr>
								<th>보안시설</th>
								<td colspan="3">
									<span>
										<input type="checkbox" name="res_option" id="res_option6" value="인터폰" <c:if test="${ !empty res6 }">checked</c:if>/>
											<label for="res_option6">인터폰</label>
									</span>
									<span>
										<input type="checkbox" name="res_option" id="res_option7" value="방범창"<c:if test="${ !empty res7 }">checked</c:if>/>
											<label for="res_option7">방범창</label>
									</span>
									<span>
										<input type="checkbox" name="res_option" id="res_option10" value="CCTV"<c:if test="${ !empty res10 }">checked</c:if>/>
											<label for="res_option10">CCTV</label>
									</span>
									<span>
										<input type="checkbox" name="res_option" id="res_option11" value="현관보안시스템" <c:if test="${ !empty res11 }">checked</c:if>/>
											<label for="res_option11">현관보안</label>
									</span>
									<span>
										<input type="checkbox" name="res_option"id="res_option12" value="경비원"<c:if test="${ !empty res12 }">checked</c:if>/>
											<label for="res_option12">경비원</label>
									</span>
									
									<span>
										<input type="checkbox" name="res_option"id="res_option14" value="카드키" <c:if test="${ !empty res14 }">checked</c:if>/>
											<label for="res_option14">카드키</label>
									</span>
								</td>
							</tr>
							<tr>
								<th>난방옵션</th>
								<td colspan="3">
									<span>
										<input type="checkbox" name="res_option" id="res_option9" value="개별난방"<c:if test="${ !empty res9 }">checked</c:if>/>
											<label for="res_option9">개별난방</label>
									</span>
								</td>
							</tr>
							<tr>
								<th>편의시설</th>
								<td colspan="3">
									<span>
										<input type="checkbox" name="res_option"id="res_option13" value="무인택배함" <c:if test="${ !empty res13 }">checked</c:if>/>
											<label for="res_option13">무인택배함</label>
									</span>
									<span>
										<input type="checkbox" name="res_option" id="res_option1" value="주차가능" <c:if test="${ !empty res1 }">checked</c:if>/>
											<label for="res_option1">주차가능</label>
									</span>
									<span>
										<input type="checkbox" name="res_option" id="res_option2" value="엘리베이터" <c:if test="${ !empty res2 }">checked</c:if>/>
											<label for="res_option2">엘리베이터</label>
									</span>
									<span>
										<input type="checkbox" name="res_option" id="res_option3" value="반려동물" <c:if test="${ !empty res3 }">checked</c:if>/>
											<label for="res_option3">반려동물가능</label>
									</span>
									<span>
										<input type="checkbox" name="res_option" id="res_option4" value="전세대출" <c:if test="${ !empty res4 }">checked</c:if>/>
											<label for="res_option4">전세대출가능</label>
									</span>
									<span>
										<input type="checkbox" name="res_option" id="res_option5" value="큰 길가" <c:if test="${ !empty res5 }">checked</c:if>/>
											<label for="res_option5">큰 길가</label>
									</span>
									
								</td>
							</tr>
						</table>
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
						<div class="tableTit">생활 옵션</div>
						<table class="writeTable">
							
							<tr>
								<th>가구 옵션</th>
								<td colspan="3">
									<span>
										<input type="checkbox" name="living_option" id="living_type_2" value="신발장"<c:if test="${ !empty live2 }">checked</c:if>/>
											<label for="living_type_2">신발장</label>
									</span>
									<span>
										<input type="checkbox" name="living_option" id="living_type_4" value="침대"<c:if test="${ !empty live4 }">checked</c:if>/> 
											<label for="living_type_4">침대</label>
									</span>
									<span>
										<input type="checkbox" name="living_option" id="living_type_5" value="싱크대" <c:if test="${ !empty live5 }">checked</c:if>/>
											<label for="living_type_5">싱크대</label>
									</span>
									<span> 
										<input type="checkbox" name="living_option" id="living_type_8" value="옷장" <c:if test="${ !empty live8 }">checked</c:if>/>
											<label for="living_type_8">옷장</label>
									</span>
									<span>
										<input type="checkbox" name="living_option" id="living_type_12" value="붙박이장"<c:if test="${ !empty live12 }">checked</c:if>/>
											<label for="living_type_12">붙박이장</label>
									</span>
									<span>
										<input type="checkbox" name="living_option" id="living_type_13" value="식탁"<c:if test="${ !empty live13 }">checked</c:if>/>
											<label for="living_type_13">식탁</label>
									</span>
								</td>
							</tr>
							<tr>
								<th>가전 옵션</th>
								<td colspan="3">
									<span>
										<input type="checkbox" name="living_option" id="living_type_1" value="에어컨"<c:if test="${ !empty live1 }">checked</c:if>/>
											<label for="living_type_1">에어컨</label>
									</span>
									<span>
										<input type="checkbox" name="living_option" id="living_type_3" value="세탁기"<c:if test="${ !empty live3 }">checked</c:if>/>
											<label for="living_type_3">세탁기</label>
									</span>
									<span>
										<input type="checkbox" name="living_option" id="living_type_6" value="가스레인지"<c:if test="${ !empty live6 }">checked</c:if>/>
											<label for="living_type_6">가스레인지</label>
									</span>
									<span>
										<input type="checkbox" name="living_option" id="living_type_7" value="전자레인지"<c:if test="${ !empty live7 }">checked</c:if>/>
											<label for="living_type_7">전자레인지</label>
									</span>
									<span>
										<input type="checkbox" name="living_option" id="living_type_14" value="냉장고"<c:if test="${ !empty live14 }">checked</c:if>/>
											<label for="living_type_14">냉장고</label>
									</span>
									<span>
										<input type="checkbox" name="living_option" id="living_type_15" value="TV"<c:if test="${ !empty live15 }">checked</c:if>/>
											<label for="living_type_15">TV</label>
									</span>
								</td>
							</tr>
							<tr>
								<th>욕실 옵션</th>
								<td colspan="3">
									<span>
										<input type="checkbox" name="living_option" id="living_type_9" value="샤워부스" <c:if test="${ !empty live8 }">checked</c:if>/>
											<label for="living_type_9">샤워부스</label>
									</span>
									<span>
										<input type="checkbox" name="living_option" id="living_type_10" value="욕조" <c:if test="${ !empty live10 }">checked</c:if>/>
											<label for="living_type_10">욕조</label>
									</span>
									<span>
										<input type="checkbox" name="living_option" id="living_type_11" value="비데" <c:if test="${ !empty live11 }">checked</c:if>/>
											<label for="living_type_11">비데</label>
									</span>
								</td>
							</tr>
						</table>

 
 <script type="text/javascript">
//파일확장자 체크
	function checkFile(f){
		 var file = f.files;
		//파일확장자 정규식 검사
		 if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)){
			 alert("gif, jpg, png, jpeg 파일만 등록가능합니다. \n\n 현재파일 : " + file[0].name);
			 f.outerHTML = f.outerHTML; //파일 입력폼초기화
			 document.getElementById('imgbox').innerHTML = '';
		 } else {
			 if( file[0].size < 1024*1024*10 ){
				 alert(file[0].size);
			 if (f.files && f.files[0]) {
				 var reader = new FileReader();
				 var fileSize = $("#fileUl > li").length;
					//alert("갯수 : " + fileSize);
				 reader.onload = function (e) { 
					 $('#image_section').attr('src', e.target.result); 
				 } 
				 reader.readAsDataURL(f.files[0]); 
			}
			 } else {
				 alert("파일은 10MB 이내사이즈만 등록가능합니다.");
				 f.outerHTML = f.outerHTML;
			 }
			 return;
		 }
	}// filecheck
	function checkFile1(f){
		 var file = f.files;
		 if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)){
			 alert("gif, jpg, png, jpeg 파일만 등록가능합니다. \n\n 현재파일 : " + file[0].name);
			 f.outerHTML = f.outerHTML; //파일 입력폼초기화
			 document.getElementById('imgbox').innerHTML = '';
		 } else {
			 if( file[0].size < 1024*1024*10 ){
				 alert(file[0].size);
			 if (f.files && f.files[0]) {
				 var reader = new FileReader();
				 var fileSize = $("#fileUl > li").length;
					//alert("갯수 : " + fileSize);
				 reader.readAsDataURL(f.files[0]); 
			}
			 } else {
				 alert("파일은 10MB 이내사이즈만 등록가능합니다.");
				 f.outerHTML = f.outerHTML;
			 }
			 return;
		 }
	}// filecheck
 	//파일 추가
	$().ready(function(){
		$("#addfile").click(function(){
			var fileSize = $("#fileUl > li").length;
			 /* alert("갯수 : " + fileSize); */
			if( fileSize < 6){
			$("#fileUl").append(
					'<li class="file-row"><input type="file" name="new_file" id="pro_images"onchange="checkFile1(this)" required/><input type="button" class="btnRemove" id="delfile" value="삭제"/></li>'
			); // append
			} else {
				alert("파일첨부는 최대 5장만 가능합니다.");
			}
			$('.btnRemove').on('click', function () {
				$(this).parents("li").remove();
		        $(this).prev().remove();
		        $(this).remove();
		    });
		}); // click
	}); //reday
	
 </script>
						<div class="tableTit">매물 사진 수정</div>
						<div class="comment_box">
							<p class="t_comment">최소 1장이상 최대 5장 (한장 당 10MB 이내)</p>
							<p class="t_comment">최초 첨부파일 갯수보다 적게 등록할 수 없습니다.</p>
						</div>
						<table class="writeTable">
							<tr>
								<td>
									<ul id="fileUl">
									<li><input type="button" id="addfile" value="파일추가"/></li>
									<c:forEach items="${ bfile }" var="BangUploadFile"  varStatus="index">
										
										 <c:if test="${ index.count eq 1 }">
										 	<li class="file-row" id="file-row" style="font-size:10pt;">
										 	<input type="file" name="new_file" id="pro_images" onchange="checkFile(this)"/>등록 파일 : ${ BangUploadFile.original_file }
										 </c:if>
										 <c:if test="${ index.count ne 1 }">
											<li class="file-row" id="file-row" style="font-size:10pt;">
											<input type="file" name="new_file" id="pro_images"/>등록 파일 : ${ BangUploadFile.original_file }
											</li>
										</c:if>
									</c:forEach>
									</ul>
								<!--  https://extracold.tistory.com/40  -->
									<ul class="img-align" id="imgbox">
										<li>
											<img id="image_section" src="#" alt="thumbnail1" onerror="this.src='${ pageContext.request.contextPath }/resources/images/no_image_242_161.jpg'"/>
										</li>
									</ul>
								</td>
							</tr>
						</table>
						<div class="tableTit">매물 상세정보</div>
						<div class="comment_box">
							<p class="t_comment">매물에 대한 자세한 설명을 입력해주세요.</p>
							<p class="t_comment">방 정보, 가격협의 내용, 교통 등 자세한 내용을 작성해 주실수록 거래가
								성사될 가능성이 높습니다.</p>
						</div>
						<table class="writeTable">
							<tr>
								<th>상세설명</th>
								<td><textarea maxlength="500" name="pro_content" required >${ Bang.pro_content }</textarea></td>
							</tr>
						</table> 

						<%-- <c:url var="blist" value="blist.do">
							<c:param name="pro_no" value="${ Bang.pro_no }"/>
							<c:param name="old_file" value="${ bfile }"/>
						</c:url> --%>
						<div class="btnRegistBox">
							<%-- <a href="${ blist }" class="btnCancel">목록으로</a> --%>
							<c:if test="${ userType eq 'admin' }">
								<c:url var="adminBack" value="binfo.do">
									<c:param name="userType" value="admin"/>
									<c:param name="pro_no" value="${ Bang.pro_no }"/>
									<c:param name="id" value="${ Bang.id }"/>
								</c:url>
							<a href="${ adminBack }"  class="btnCancel">취소</a>
							<a href="javascript:void(0);" class="btnRegistz"><input type="submit" value="수정하기"/></a>
							</c:if>
							<c:if test="${ userType eq 'all' }">
								<c:url var="allBack" value="binfo.do">
									<c:param name="userType" value="all"/>
									<c:param name="pro_no" value="${ Bang.pro_no }"/>
									<c:param name="id" value="${ sessionScope.loginMember.id }"/>
								</c:url>
							<a href="${ allBack }"  class="btnCancel">취소</a>
							<a href="javascript:void(0);" class="btnRegistz"><input type="submit" value="수정하기"/></a>
							</c:if>
							<c:if test="${ userType eq 'writer' }">
								<c:url var="writerBack" value="binfo.do">
									<c:param name="userType" value="writer"/>
									<c:param name="pro_no" value="${ Bang.pro_no }"/>
									<c:param name="id" value="${ sessionScope.loginMember.id }"/>
								</c:url>
							<a href="${ writerBack }"  class="btnCancel">취소</a>
							<a href="javascript:void(0);" class="btnRegistz"><input type="submit" value="수정하기"/></a>
							</c:if>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>