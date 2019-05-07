<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <script>
         
          var bounds;
          var swLat;
          var swLng;
          var neLat;
          var neLng;
          var action;
          
         // 지도 영역정보를 얻어옵니다
         bounds = map.getBounds();
                 
           // 영역정보의 남서쪽 정보를 얻어옵니다 
           swLat = bounds.getSouthWest().getLat(); // 남서쪽 위도
           swLng = bounds.getSouthWest().getLng(); // 남서쪽 경도
           
           // 영역정보의 북동쪽 정보를 얻어옵니다 
           neLat = bounds.getNorthEast().getLat(); // 북동쪽 위도
           neLng = bounds.getNorthEast().getLng(); // 북동쪽 경도
           
           $.get("/bangbang/resources/data/address.json", function(data) {
             $.each(data.positions, function(i, position) {
                geocoder.addressSearch(position.address, function(result, status) {
                  // 내용 검색 된다면
                   if (status === daum.maps.services.Status.OK) {
                      var coords = new daum.maps.LatLng(result[0].y, result[0].x);
                      
                      // 영역 안에 있는 데이터 출력
                      if( swLat <= coords.getLat() && neLat >= coords.getLat() && swLng <= coords.getLng() && neLng >= coords.getLng() ){
                           // json 객체 만들어 컨트롤러로 보내기
                           var infoData = new Object();
                           infoData.pro_no = position.pro_no;
                           
                           $.ajax({ 
                               type: "post", 
                               url: "/bangbang/marealist.do", 
                               data: infoData,
                               complete: function(){
                                  $('#loading-mask').fadeOut(500);
                               },
                              success: function(data) {
                                  var jsonStr = JSON.stringify(data);
                                 var con = JSON.parse(jsonStr);
                                 
                              for(var i in con.list){
                                 // 계약형태
                                 var conType = con.list[i].con_type;
                                 var ctClass;
                                 if(conType == "월세"){ 
                                    ctClass = "p_Way_a"; 
                                 } else if(conType == "전세"){ 
                                    ctClass = "p_Way_b"; 
                                 } else if(conType == "단기임대"){ 
                                    ctClass = "p_Way_c"; 
                                 } else if(conType == "매매"){ 
                                    ctClass = "p_Way_d";
                                 }
                                 
                                 // 월세여부
                                 var rent = con.list[i].rent;
                                 if(rent == 0){
                                    rent = "";
                                 } else {
                                    rent = "/" + rent;
                                 }
                                 
                                    $(".bangUl").html($(".bangUl").html() + (
                                          "<li class='curPoint'>" +
                                                "<input type='hidden' value='" + con.list[i].pro_no + "' id='litNo' />" +
                                                "<input type='hidden' value='" + coords.getLat() + "' id='mLat' />" +
                                             "<input type='hidden' value='" + coords.getLng() + "' id='mLng' />" +
                                             "<a href='binfo.do?pro_no=" + con.list[i].pro_no + "&id=" + con.list[i].id + "'target='_blank' class='infoLink'>" +
                                                   "<div class='bangInfoBox'>" +
                                                      "<div class='imgBox left'>" +
                                                      "<img src='./resources/files/bang/" + con.list[i].rename_file + "' onError='javascript:this.src=\"./resources/images/no_image.jpg\"' alt='방이미지'>" +
                                                        "</div>" +
                                                        "<div class='infoBox right'>" +
                                                         "<dl>" +
                                                             "<dd class='infoRow row1'>" +
                                                               "<span class='p_Way " + ctClass + "'>" + conType + "</span>" +
                                                                 "<span class='price nbgFont'>"+ con.list[i].deposit + rent + "</span>" +
                                                             "</dd>" +
                                                               "<dd class='infoRow row2'><span>" + con.list[i].pro_content + "</span></dd>" +
                                                             "<dd class='infoRow row3'><span>"
                                                                + con.list[i].build_type + " / "
                                                                + "방" + con.list[i].room_count + "개 / "
                                                                + con.list[i].floor + "층 / " 
                                                                + "관리비 " + con.list[i].manage_pay + "만원" +
                                                             "</span></dd>" +
                                                         "</dl>" +
                                                     "</div>" +
                                                  "</a>" +
                                                  "<div class='clr'></div>" +
                                              "</div>" +
                                          "</li>"
                                    ));
                              }
                              $("#mCount").html($(".bangUl li").length);
                              
                              // 리스트 mouseenter & mouseleave 시 마커 생성
                                    var marker;

                                    var imageSrc = './resources/images/Ripple-1.5s-100px.svg', // 마커이미지의 주소입니다    
                                        imageSize = new daum.maps.Size(100, 100), // 마커이미지의 크기입니다
                                       imageOption = {offset: new daum.maps.Point(50, 50)};
                                          
                                    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
                                    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
                                    
                                 $(".bangUl .curPoint").on('mouseenter',function(){
                                    var hLat = $(this).find("#mLat").val();
                                    var hLng = $(this).find("#mLng").val();
                                       
                                    // 마커를 표시할 위치입니다 
                                    var position =  new daum.maps.LatLng(hLat, hLng);

                                    // 마커를 생성합니다
                                    marker = new daum.maps.Marker({
                                      position: position,
                                      image: markerImage
                                    });
                                    
                                    // 마커를 지도에 표시합니다.
                                    marker.setMap(map);
                                  }).on('mouseleave',function(){
                                      marker.setMap(null);
                                  });
                                 
                               },
                               error: function(request, status, errorData){
                                 console.log("error code : " + request.status + 
                                          "\nmessage : " + request.responseText + 
                                          "\nerror : " + errorData);
                              }
                           });
                      }
                   }
                  });
             });
          });
         
           var count;
          daum.maps.event.addListener(map, 'idle', function() {
             $('#loading-mask').fadeIn(500);
             $(".bangUl").empty();
             // 지도 영역정보를 얻어옵니다
            bounds = map.getBounds();
             
              // 영역정보의 남서쪽 정보를 얻어옵니다 
              swLat = bounds.getSouthWest().getLat(); // 남서쪽 위도
              swLng = bounds.getSouthWest().getLng(); // 남서쪽 경도
              
              // 영역정보의 북동쪽 정보를 얻어옵니다 
              neLat = bounds.getNorthEast().getLat(); // 북동쪽 위도
              neLng = bounds.getNorthEast().getLng(); // 북동쪽 경도
             
              $.get("/bangbang/resources/data/address.json", function(data) {
                 if(data.positions.length == 0){
                    $('#loading-mask').fadeOut(500);
                 } else {
                   $.each(data.positions, function(i, position) {
                      geocoder.addressSearch(position.address, function(result, status) {
                        // 내용 검색 된다면
                         if (status === daum.maps.services.Status.OK) {
                            var coords = new daum.maps.LatLng(result[0].y, result[0].x);
                            
                            // 영역 안에 있는 데이터 출력
                            if( swLat <= coords.getLat() && neLat >= coords.getLat() && swLng <= coords.getLng() && neLng >= coords.getLng() ){
                                 var infoData = new Object();
                                 infoData.pro_no = position.pro_no;
                                 $(".bangUl .noList").remove();
   
                                 $.ajax({ 
                                     type: "post", 
                                     url: "/bangbang/marealist.do", 
                                     data: infoData,
                                     complete: function(){
                                        $('#loading-mask').fadeOut(500);
                                     },
                                     cache: false,
                                     success: function(data) {
                                        var jsonStr = JSON.stringify(data);
                                       var con = JSON.parse(jsonStr);
                                       
                                       for(var i in con.list){
                                          // 계약형태
                                          var conType = con.list[i].con_type;
                                          var ctClass;
                                          if(conType == "월세"){ 
                                             ctClass = "p_Way_a"; 
                                          } else if(conType == "전세"){ 
                                             ctClass = "p_Way_b"; 
                                          } else if(conType == "단기임대"){ 
                                             ctClass = "p_Way_c"; 
                                          } else if(conType == "매매"){ 
                                             ctClass = "p_Way_d";
                                       }
                                          
                                          // 월세여부
                                          var rent = con.list[i].rent;
                                          if(rent == 0){
                                             rent = "";
                                          } else {
                                             rent = "/" + rent;
                                          }
                                       
                                          $(".bangUl").html($(".bangUl").html() + (
                                                "<li class='curPoint'>" +
                                                      "<input type='hidden' value='" + con.list[i].pro_no + "' id='litNo' />" +
                                                      "<input type='hidden' value='" + coords.getLat() + "' id='mLat' />" +
                                                   "<input type='hidden' value='" + coords.getLng() + "' id='mLng' />" +
                                                   "<a href='binfo.do?pro_no=" + con.list[i].pro_no + "&id=" + con.list[i].id + "'target='_blank' class='infoLink'>" +
                                                         "<div class='bangInfoBox'>" +
                                                            "<div class='imgBox left'>" +
                                                            "<img src='./resources/files/bang/" + con.list[i].rename_file + "' onError='javascript:this.src=\"./resources/images/no_image.jpg\"' alt='방이미지'>" +
                                                              "</div>" +
                                                              "<div class='infoBox right'>" +
                                                               "<dl>" +
                                                                   "<dd class='infoRow row1'>" +
                                                                     "<span class='p_Way " + ctClass + "'>" + conType + "</span>" +
                                                                       "<span class='price nbgFont'>"+ con.list[i].deposit + rent + "</span>" +
                                                                   "</dd>" +
                                                                     "<dd class='infoRow row2'><span>" + con.list[i].pro_content + "</span></dd>" +
                                                                   "<dd class='infoRow row3'><span>"
                                                                      + con.list[i].build_type + " / "
                                                                      + "방" + con.list[i].room_count + "개 / "
                                                                      + con.list[i].floor + "층 / " 
                                                                      + "관리비 " + con.list[i].manage_pay + "만원" +
                                                                   "</span></dd>" +
                                                               "</dl>" +
                                                           "</div>" +
                                                        "</a>" +
                                                        "<div class='clr'></div>" +
                                                    "</div>" +
                                                "</li>"
                                             ));

                                       }
                                       $("#mCount").html($(".bangUl li").length);
                                       
                                       // 리스트 mouseenter & mouseleave 시 마커 생성
                                          var marker;
                                    
                                          var imageSrc = './resources/images/Ripple-1.5s-100px.svg', // 마커이미지의 주소입니다    
                                           imageSize = new daum.maps.Size(100, 100), // 마커이미지의 크기입니다
                                          imageOption = {offset: new daum.maps.Point(50, 50)};
                                             
                                          // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
                                          var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
                                          
                                       $(".bangUl .curPoint").on('mouseenter',function(){
                                          var hLat = $(this).find("#mLat").val();
                                          var hLng = $(this).find("#mLng").val();
                                             
                                          // 마커를 표시할 위치입니다 
                                          var position =  new daum.maps.LatLng(hLat, hLng);
   
                                          // 마커를 생성합니다
                                          marker = new daum.maps.Marker({
                                            position: position,
                                            image: markerImage
                                          });
                                          
                                          // 마커를 지도에 표시합니다.
                                          marker.setMap(map);
                                        }).on('mouseleave',function(){
                                            marker.setMap(null);
                                        });
                                       
                                     },
                                     error: function(request, status, errorData){
                                       console.log("error code : " + request.status + 
                                                "\nmessage : " + request.responseText + 
                                                "\nerror : " + errorData);
                                    }
                                 });
                                 
                            } else {
                               $('#loading-mask').fadeOut(500);
                            }
                         }
                        });
                   });
                 }
            });
              
              if($(".bangUl").is(':empty')){
                 $(".bangUl").html("<p class='noList'><span class='icon'></span>매물이 없어요!</p>");
                 if($(".bangUl .noList").length == 1){
                    $("#mCount").html("0");
                 }
              }
          });
   </script>
   <script>
          // 장소 검색 객체를 생성합니다
          var ps = new daum.maps.services.Places(); 
         
         // 키워드 검색을 요청하는 함수입니다
         function searchPlaces() {
         
            var keyword = document.getElementById('keyword').value;
         
             if (!keyword.replace(/^\s+|\s+$/g, '')) {
                 alert('키워드를 입력해주세요!');
                 return false;
             }
         
             // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
             ps.keywordSearch( keyword, placesSearchCB); 
         }
         
         // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
         function placesSearchCB (data, status, pagination) {
            if (status === daum.maps.services.Status.OK) {
                 // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                 // LatLngBounds 객체에 좌표를 추가합니다
                 var bounds = new daum.maps.LatLngBounds();
         
                 for (var i=0; i<data.length; i++) {
                     bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x)); //위도, 경도           
                 }       
                 // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                 map.setBounds(bounds);
         
             } else if (status === daum.maps.services.Status.ZERO_RESULT) {
                 alert('검색 결과가 존재하지 않습니다.');
                 return;
         
             } else if (status === daum.maps.services.Status.ERROR) {
                 alert('검색 결과 중 오류가 발생했습니다.');
                 return;
         
             }
         }
   </script>
   <script>
         //보증금
         function changedeposit(a){
            var high1 = ["500","1000","5000","10000","20000","30000","50000"];
            var high2 = ["1000","5000","10000","20000","30000","50000"];
            var high3 = ["5000","10000","20000","30000","50000"];
            var high4 = ["10000","20000","30000","50000"];
            var high5 = ["20000","30000","50000"];
            var target = document.getElementById("high_deposit");
            console.log(a.value);
            if(a.value == "0") var hi = high1;
            else if (a.value == "500") var hi = high2;
            else if (a.value == "1000") var hi = high3;
            else if (a.value == "5000") var hi = high4;
            else if (a.value == "10000") var hi = high5;
            
            target.options.length = 0;
            for ( h in hi){
               var deposit_option = document.createElement("option");
               deposit_option.value = hi[h];
               deposit_option.innerHTML = hi[h];
               target.appendChild(deposit_option);
            }
         };
         
         //월세
         function changeRent(a){
            var high1 = ["10","20","30","50","100","200","300"];
            var high2 = ["20","30","50","100","200","300"];
            var high3 = ["50","100","200","300"];
            var high4 = ["100","200","300"];
            var high5 = ["200","300"];
            var target = document.getElementById("high_rent");
            console.log(a.value);
            if(a.value == "0") var hi = high1;
            else if (a.value == "10") var hi = high2;
            else if (a.value == "30") var hi = high3;
            else if (a.value == "50") var hi = high4;
            else if (a.value == "100") var hi = high5;
            
            target.options.length = 0;
            for ( h in hi){
               var rent_option = document.createElement("option");
               rent_option.value = hi[h];
               rent_option.innerHTML = hi[h];
               target.appendChild(rent_option);
            }
         };
         
         //방구조 필수체크
         function CheckForm(aa){
             var buildCheck = false;
             var arr_build = document.getElementsByName("build_type");
             for(var i=0;i<arr_build.length;i++){
                 if(arr_build[i].checked == true) {
                    buildCheck = true;
                     break;
                 }
             }
             if(!buildCheck){
                 alert("건물유형을 1개이상 선택해주세요");
                 return false;
             }
         }
      </script>
   </head>
   <body>
      
      <div id="" class="sideRight mapRightWrap">
         <div class="sideNav sideNav1">
            <form onsubmit="searchPlaces(); return false;">
               <div class="keyBox">
                      <input type="text" value="" id="keyword" size="15" placeholder="주소명, 건물명, 지하철역 이름 등으로 검색해 보세요" /> 
                       <button type="submit" class="btnKSearch"><span class="fas fa-search"></span></button> 
                 </div>
              </form>
              
              <div class="searchCon">
               <div class="sideTop searchForm">
                  <span>조건검색</span>
                  <a href="javascript:void(0);" class="btnShow"><span>더보기 +</span></a>
               </div>

               <!-- name="searchMap" id="searchMap" -->
               <form action="selectMapSearch.do" onSubmit="return CheckForm(this)" method="post">
                  <div class="sideCon sideSForm" style="display:none;">
                     <dl>
                        <dd class="section section1">
                           <strong>
                              <input type="checkbox" id="deposit" name="deposit"class="chk" value="보증금" checked
                              onClick="if(this.checked){low_deposit.disabled=0; high_deposit.disabled=0 }else{low_deposit.disabled=1; high_deposit.disabled=1}">
                              보증금으로 찾기 (단위/만원)
                           </strong>
                           <div class="pBoxTop">
                              <div class="select_box pBox1">
                                 <div class="select" >
                                            <select name="low_deposit" id="low_deposit"  name="low_deposit" onchange="changedeposit(this);" class="a_list region" title="select sDepositSt" required>
                                               <option value="0">0</option>
                                               <option value="500">500</option>
                                                <option value="1000">1,000</option>
                                                <option value="5000">5,000</option>
                                                <option value="10000">10,000</option>
                                            </select>
                                 </div>
                                 <script type="text/javascript">
                                    $("#low_deposit").val("${ low_deposit }");
                                 </script>
                              </div>
                           
                              <span class="mid">~</span>
                              <div class="select_box pBox2">
                                 <div class="select">
                                           <select name="high_deposit" id="high_deposit" name="high_deposit" class="a_list region" title="select sDepositSt" required>
                                              <option value=""></option>
                                            </select>
                                 </div>
                                 <script type="text/javascript">
                                    $("#high_deposit").val("${ high_deposit }");
                                 </script>
                              </div>
                           </div>
                        </dd>
                        <dd class="section section2">
                           <strong>
                              <input type="checkbox" id="rent" name="rent"class="chk" value="월세" checked
                              onClick="if(this.checked){low_rent.disabled=0; high_rent.disabled=0 }else{low_rent.disabled=1; high_rent.disabled=1}">
                              월세로 찾기 (단위/만원)
                           </strong>
                           <div class="pBoxTop">
                              <div class="select_box pBox1">
                                 <div class="select">
                                            <select name="low_rent" id="low_rent" onchange="changeRent(this);" class="a_list region" title="select sRentSt" required>
                                               <option value="0">0</option>
                                               <option value="10">10</option>
                                                <option value="30">30</option>
                                                <option value="50">50</option>
                                                <option value="100">100</option>
                                            </select>
                                 </div>
                                 <script type="text/javascript">
                                    $("#low_rent").val("${ low_rent }");
                                 </script>
                              </div>
                              <span class="mid">~</span>
                              <div class="select_box pBox2">
                                 <div class="select">
                                            <select name="high_rent" id="high_rent" class="a_list region" title="select sRentSt" required>
                                               <option value=""></option>
                                             </select>
                                 </div>
                                 <script type="text/javascript">
                                    $("#high_rent").val("${ high_rent }");
                                 </script>
                              </div>
                           </div>
                        </dd>
                        <dd class="section section3">
                           <strong>* 건물유형</strong>
                           <div class="chkOpt">
                                     <c:forEach items="${ btype }" var="btype">
                                 <c:if test="${ btype eq '오피스텔'}"><c:set var="bty1" value="${ btype }"/></c:if>
                                 <c:if test="${ btype eq '아파트' }"><c:set var="bty2" value="${ btype }"/></c:if>
                                 <c:if test="${ btype eq '빌라' }"><c:set var="bty3" value="${ btype }"/></c:if>
                                 <c:if test="${ btype eq '주택' }"><c:set var="bty4" value="${ btype }"/></c:if>
                              </c:forEach>
                               <input type="checkbox" id="opt1" name="build_type" value="오피스텔" <c:if test="${ !empty bty1 }">checked </c:if>class="chk"/>
                              <label for="opt1">오피스텔</label>
                                     <input type="checkbox" id="opt2" name="build_type" value="아파트" <c:if test="${ !empty bty2 }">checked </c:if>class="chk"/>
                              <label for="opt2">아파트</label>
                                     <input type="checkbox" id="opt3" name="build_type" value="빌라" <c:if test="${ !empty bty3 }">checked </c:if>class="chk"/>
                              <label for="opt3">빌라</label>
                                     <input type="checkbox" id="opt4" name="build_type" value="주택" <c:if test="${ !empty bty4 }">checked </c:if>class="chk"/>
                              <label for="opt4">주택</label>
                           </div>
                        </dd>
                        <input class="btnSearch" type="submit" value="선택한 조건으로 검색하기">
                     </dl>
                  </div>
               </form>
            </div>
         </div>
         <div class="sideNav sideNav2">
            <div class="sideTop">
               <span class="searchTitle">검색결과 <span id="mCount">0</span>개</span>
            </div>
            <div class="sideCon">
               <p class="conTit">BangBang이 추천하는 공인 중개업소 매물</p>
               <div class="sideBangLit">
                  <ul class="bangUl">
                     
                  </ul>
               </div>
            </div>
         </div>
      </div>
      <script type="text/javascript">
         $(function(){
            // 상세검색 폼 슬라이드 토글
            $(".sideNav .searchForm").on("click", function(){
               $(".sideSForm").slideToggle();               
            });
            
            // 방리스트 리사이즈
            var docHeight         = $(document).height();
            var sideNav1Height      = $('.sideNav1').height();
            var etcHeight         = 40 + 50;
            var sideBangLitHeight   = docHeight - (sideNav1Height + etcHeight);
            
            //$(window).resize(function(){
               var sideNav1Height      = $('.sideNav1').height();
               var sideBangLitHeight   = docHeight - (sideNav1Height + etcHeight);
               $('.sideBangLit').height(sideBangLitHeight);
            //});
            
         });
      </script>
   </body>
</html>