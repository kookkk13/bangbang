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
	// 도로명주소 api 설정
	function openZipSearch() {
		new daum.Postcode({
			oncomplete : function(data) {
				$('[name=zip]').val(data.zonecode);
				$('[name=pro_address]').val(data.address);
				$('[name=pro_detail]').val(data.buildingName);
			}
		}).open();
	};
</script>
<script type="text/javascript">
	//준공년월 입력란 비활성화
	function check_build_date(form) {
		if (form.build_date.disabled == true) {
			form.build_date.disabled = false
		} else {
			form.build_date.disabled = true
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
</script>
<script type="text/javascript">
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
				<h3 class="registTit">방 등록하기</h3>
				<h4> 작성자 :  ${ sessionScope.loginMember.id }</h4>
				<div class="registConBox">
					<form name="writeForm" id="writeForm" action="insertBang.do" onSubmit="return CheckForm(this)" method="post" enctype="multipart/form-data">
						<input type="hidden" name="id" value="${ sessionScope.loginMember.id }"/>
						<div class="tableTit">매물 기본정보</div>
						<table class="writeTable">
							<tr>
								<th>건물 형태</th>
								<td colspan="3">
									<div class="select">
										<select style="width: 180px;" name="build_type" required>
											<option value="오피스텔">오피스텔</option>
											<option value="원룸">원룸</option>
											<option value="빌라">빌라</option>
											<option value="아파트">아파트</option>
											<option value="주택">주택</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<th>매물 소재지</th>
								<td colspan="3">
									<div class="form-group">
										<label>우편번호 </label>
										<div class="input-group mb-3">
											<input type="text" name="zip" style="width: 100px; height: 30px; border-radius: 4px;" class="form-control" required/>
											<button type="button" style="width: 60px; height: 30px; margin-left: 10px; line-height: 1.2px;"
												onclick="openZipSearch(); " class="btn btn-info">검색</button>
										</div>
										<br>
											<input type="text" name="pro_address"style="width: 300px; height: 30px;" readonly class="form-control" style="clear:left;" />
										<br>
											<input type="text" name="pro_detail" id="detailadd" style="width: 300px; height: 30px;" class="form-control" style="clear:left;" placeholder="상세주소를 입력해주세요." />
									</div>
								</td>
							</tr>
							<tr>
								<th>방 개수</th>
								<td>
									<input type="number" name="room_count" style="width: 80px;" min="1" max="10" step="1" required/>
										<span class="l-mark">개</span>
								</td>
								<th>욕실 개수</th>
								<td>
									<input type="number" name="bath_count" style="width: 80px;" min="1" max="10" step="1" required/>
										<span class="l-mark">개</span>
								</td>
							</tr>
							<tr>
								<th rowspan="2">층수</th>
								<td rowspan="2">
									<span class="f-mark">해당 층수</span>
										<input type="number" style="width: 80px;" placeholder="층입력" name="floor" min="-1" max="50" step="1" required/>
											&nbsp; <span class="l-mark">지하일경우 -(층)</span>
								</td>
								<th rowspan="2">평수</th>
								<td>
									<span class="f-mark">공급면적</span>
										<input type="number" style="width: 80px;" placeholder="면적 입력" name="supply_area" min="1" required/>
											<span class="l-mark">㎡</span>
								</td>
							</tr>
							<tr>
								<td>
									<span class="f-mark">전용면적</span>
										<input type="number" style="width: 80px;" placeholder="면적 입력" name="real_area" min="1" required/>
											<span class="l-mark">㎡</span>
								</td>
							</tr>
							<tr>
								<th>방향</th>
								<td colspan="3">
									<span>
										<input type="radio" name="direction" id="room_direction_type_e" value="동" required/>
											<label for="room_direction_type_e"> 동</label>
									</span>
									<span>
										<input type="radio" name="direction" id="room_direction_type_w" value="서"/>
											<label for="room_direction_type_w"> 서</label>
									</span>
									<span>
										<input type="radio" name="direction"id="room_direction_type_s" value="남"/>
											<label for="room_direction_type_s"> 남</label>
									</span>
									<span>
										<input type="radio" name="direction" id="room_direction_type_n" value="북"/>
											<label for="room_direction_type_n"> 북</label>
									</span>
									<span>
										<input type="radio" name="direction" id="room_direction_type_se" value="남동"/>
											<label for="room_direction_type_se"> 남동</label>
									</span>
									<span>
										<input type="radio" name="direction" id="room_direction_type_sw" value="남서"/>
											<label for="room_direction_type_sw"> 남서</label>
									</span>
									<span>
										<input type="radio" name="direction" id="room_direction_type_nw" value="북서"/>
											<label for="room_direction_type_nw"> 북서</label>
									</span>
									<span>
										<input type="radio" name="direction" id="room_direction_type_ne" value="북동"/>
											<label for="room_direction_type_ne"> 북동</label>
									</span>
								</td>
							</tr>
							
							<tr>
								<th>방 거실형태</th>
								<td colspan="3">
									<span>
										<input type="radio" name="room_type" id="dinning_room_type_o" value="오픈형" required/>
											<label for="dinning_room_type_o"> 오픈형</label>
									</span>
									<span>
										<input type="radio" name="room_type" id="dinning_room_type_s" value="분리형"/>
											<label for="dinning_room_type_s"> 분리형</label>
									</span>
								</td>
							</tr>
							<tr>
								<th>현관유형</th>
								<td colspan="3">
									<span>
										<input type="radio" name="door_type" id="door_type_1" value="복도식" required/>
											<label for="door_type_1">복도식</label>
									</span>
									<span>
										<input type="radio" name="door_type" id="door_type_2" value="계단식"/>
											<label for="door_type_2"> 계단식</label>
									</span>
									<span>
										<input type="radio" name="door_type" id="door_type_3" value="복합식"/>
											<label for="door_type_3"> 복합식</label>
									</span>
								</td>
							</tr>
							
							<tr>
								<th>준공년월</th>
								<td colspan="3">
									<span>
										<input type="date" name="build_date" id="build_date" required/>
											<label for="build_date"></label>
									</span>
									<span>
										<input type="checkbox" id="build_date_n" onClick="check_build_date(this.form)"/>
											<label for="build_date_n">확인불가</label>
									</span>
								</td>
							</tr>
							<tr>
								<th>입주가능일</th>
								<td colspan="3">
									<span>
										<input type="date" name="move_date" id="move_date" required/>
											<label for="move_date"></label>
									</span>
									<span>
										<input type="checkbox" id="move_date_n" onClick="check_move_date(this.form)"/>
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
										<input type="radio" name="con_type" id="contract_type_1" value="월세" checked/>
											<label for="contract_type_1"> 월세</label>
									</span>
									<span>
										<input type="radio" name="con_type" id="contract_type_2" value="단기임대" />
											<label for="contract_type_2"> 단기임대</label>
									</span>
									<span>
										<input type="radio" name="con_type" id="contract_type_3" value="전세" />
											<label for="contract_type_3"> 전세</label>
									</span>
									<span>
										<input type="radio" name="con_type" id="contract_type_4" value="매매" />
											<label for="contract_type_4"> 매매</label>
									</span>
									
								</td>
							</tr>
							<tr>
								<th>가격정보</th>
								<td colspan="3">
									<span class="f-mark">보증금(매매금)</span>
										<input type="number" style="width: 80px;" name="deposit" min="1" required/>
											<span class="l-mark">만원</span>
										
									<span class="f-mark">월세</span>
										<input type="text" name="rent" style="width: 80px;" min="1" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required/>
											<span class="l-mark">만원</span>
								</td>
							</tr>
							<tr>
								<th>관리비</th>
								<td colspan="3">
									<span class="f-mark">관리비</span>
										<input type="number" style="width: 80px;" id="manage_pay" name="manage_pay" min="1" required/>
											<span class="l-mark">만원</span>
									<br>
									<span style="display: inline-block; margin-top: 10px;">
										<input type="checkbox" id="manage_pay_n" onClick="check_manage_pay(this.form)" />
											<label for="manage_pay_n">없음</label>
									</span>
								</td>
							</tr>
							
							<tr>
								<th>융자금</th>
								<td colspan="3">
									<span class="f-mark">융자금액</span>
										<input type="number" style="width: 80px;" id="loan" name="loan" min="1" required />
											<span class="l-mark">만원</span>
									<br>
									<span style="display: inline-block; margin-top: 10px;">
										<input type="checkbox" id="loan_n" onClick="check_loan(this.form)" />
											<label for="loan_n">없음</label>
									</span>
								</td>
							</tr>
						</table>
						<div class="tableTit">시설 옵션</div>
						<table class="writeTable">
							<tr>
								<th>보안시설</th>
								<td colspan="3">
									<span>
										<input type="checkbox" name="res_option" id="res_option6" value="인터폰" />
											<label for="res_option6">인터폰</label>
									</span>
									<span>
										<input type="checkbox" name="res_option" id="res_option7" value="방범창"/>
											<label for="res_option7">방범창</label>
									</span>
									<span>
										<input type="checkbox" name="res_option" id="res_option10" value="CCTV"/>
											<label for="res_option10">CCTV</label>
									</span>
									<span>
										<input type="checkbox" name="res_option" id="res_option11" value="현관보안시스템"/>
											<label for="res_option11">현관보안</label>
									</span>
									<span>
										<input type="checkbox" name="res_option"id="res_option12" value="경비원"/>
											<label for="res_option12">경비원</label>
									</span>
									
									<span>
										<input type="checkbox" name="res_option"id="res_option14" value="카드키"/>
											<label for="res_option14">카드키</label>
									</span>
								</td>
							</tr>
							<tr>
								<th>난방옵션</th>
								<td colspan="3">
									<span>
										<input type="checkbox" name="res_option" id="res_option9" value="개별난방"/>
											<label for="res_option9">개별난방</label>
									</span>
								</td>
							</tr>
							<tr>
								<th>편의시설</th>
								<td colspan="3">
									<span>
										<input type="checkbox" name="res_option"id="res_option13" value="무인택배함"/>
											<label for="res_option13">무인택배함</label>
									</span>
									<span>
										<input type="checkbox" name="res_option" id="res_option1" value="주차가능"/>
											<label for="res_option1">주차가능</label>
									</span>
									<span>
										<input type="checkbox" name="res_option" id="res_option2" value="엘리베이터"/>
											<label for="res_option2">엘리베이터</label>
									</span>
									<span>
										<input type="checkbox" name="res_option" id="res_option3" value="반려동물"/>
											<label for="res_option3">반려동물가능</label>
									</span>
									<span>
										<input type="checkbox" name="res_option" id="res_option4" value="전세대출"/>
											<label for="res_option4">전세대출가능</label>
									</span>
									<span>
										<input type="checkbox" name="res_option" id="res_option5" value="큰 길가"/>
											<label for="res_option5">큰 길가</label>
									</span>
									
								</td>
							</tr>
						</table>
						<div class="tableTit">생활 옵션</div>
						<table class="writeTable">
							
							<tr>
								<th>가구 옵션</th>
								<td colspan="3">
									<span>
										<input type="checkbox" name="living_option" id="living_type_2" value="신발장"/>
											<label for="living_type_2">신발장</label>
									</span>
									<span>
										<input type="checkbox" name="living_option" id="living_type_4" value="침대"/> 
											<label for="living_type_4">침대</label>
									</span>
									<span>
										<input type="checkbox" name="living_option" id="living_type_5" value="싱크대"/>
											<label for="living_type_5">싱크대</label>
									</span>
									<span> 
										<input type="checkbox" name="living_option" id="living_type_8" value="옷장"/>
											<label for="living_type_8">옷장</label>
									</span>
									<span>
										<input type="checkbox" name="living_option" id="living_type_12" value="붙박이장"/>
											<label for="living_type_12">붙박이장</label>
									</span>
									<span>
										<input type="checkbox" name="living_option" id="living_type_13" value="식탁"/>
											<label for="living_type_13">식탁</label>
									</span>
								</td>
							</tr>
							<tr>
								<th>가전 옵션</th>
								<td colspan="3">
									<span>
										<input type="checkbox" name="living_option" id="living_type_1" value="에어컨"/>
											<label for="living_type_1">에어컨</label>
									</span>
									<span>
										<input type="checkbox" name="living_option" id="living_type_3" value="세탁기"/>
											<label for="living_type_3">세탁기</label>
									</span>
									<span>
										<input type="checkbox" name="living_option" id="living_type_6" value="가스레인지"/>
											<label for="living_type_6">가스레인지</label>
									</span>
									<span>
										<input type="checkbox" name="living_option" id="living_type_7" value="전자레인지"/>
											<label for="living_type_7">전자레인지</label>
									</span>
									<span>
										<input type="checkbox" name="living_option" id="living_type_14" value="냉장고"/>
											<label for="living_type_14">냉장고</label>
									</span>
									<span>
										<input type="checkbox" name="living_option" id="living_type_15" value="TV"/>
											<label for="living_type_15">TV</label>
									</span>
								</td>
							</tr>
							<tr>
								<th>욕실 옵션</th>
								<td colspan="3">
									<span>
										<input type="checkbox" name="living_option" id="living_type_9" value="샤워부스" />
											<label for="living_type_9">샤워부스</label>
									</span>
									<span>
										<input type="checkbox" name="living_option" id="living_type_10" value="욕조"/>
											<label for="living_type_10">욕조</label>
									</span>
									<span>
										<input type="checkbox" name="living_option" id="living_type_11" value="비데"/>
											<label for="living_type_11">비데</label>
									</span>
								</td>
							</tr>
						</table>

 
 <script type="text/javascript">
 
 	//파일 추가
	$().ready(function(){
		$("#addfile").click(function(){
			var fileSize = $("#fileUl > li").length;
			if( fileSize < 6){
			$("#fileUl").append(
					'<li class="file-row"><input type="file" name="original_file" id="pro_images" onchange="checkFile1(this)"required/><input type="button" class="btnRemove"  id="delfile" value="삭제"/></li>'
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
 </script>
						<div class="tableTit">매물 시설사진</div>
						<div class="comment_box">
							<p class="t_comment">최소 1장이상 최대 5장 (한장 당 10MB 이내)</p>
							<p class="t_comment">미리보기는 썸네일용 이미지만 제공됩니다.</p>
						</div>
						<table class="writeTable">
							<tr>
								<td>
									<ul id="fileUl">
										<li><input type="button" id="addfile" value="파일추가"/></li>
										<li class="file-row"><input type="file" name="original_file" id="pro_images" onchange="checkFile(this)"required/></li>
										
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
								<td><textarea maxlength="500" name="pro_content" required></textarea></td>
							</tr>
						</table> 

						<div class="btnRegistBox">
							<a href="javascript:void(0);" class="btnCancel">취소</a>
							<a href="javascript:void(0);" class="btnRegistz"><input type="submit" value="등록"/></a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>