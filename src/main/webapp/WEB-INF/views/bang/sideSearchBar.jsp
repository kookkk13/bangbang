<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<script type="text/javascript">
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
</script>
<script type="text/javascript">
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
	<head>
		<meta charset="UTF-8">
	</head>
	<body>
		<div id="bang-searchForm" class="sideNavWrap sideNavLitWrap">
			<form action="userSBang.do" name="searchBang"id="searchBang" onSubmit="return CheckForm(this)" method="post">
			<div class="sideNav nav_1">
				<h3 class="navTit">조건으로 검색</h3>
				<dl>
					<dd class="section section3">
						<strong>
						<input type="checkbox" id="deposit" name="deposit"class="chk" value="보증금" checked
						onClick="if(this.checked){low_deposit.disabled=0; high_deposit.disabled=0 }else{low_deposit.disabled=1; high_deposit.disabled=1}">보증금으로 찾기 (단위/만원)</strong>
						<div class="pBoxTop">
							<div class="select_box pBox1">
								<div class="select" >
	                                <select name="low_deposit" id="low_deposit" required name="low_deposit" onchange="changedeposit(this);" class="a_list region" title="select sDepositSt">
	                                	<option value="0">0</option>
	                                	<option value="500">500</option>
	                                    <option value="1000">1,000</option>
	                                    <option value="5000">5,000</option>
	                                    <option value="10000">10,000</option>
	                                </select>
								</div>
							</div>
							<script type="text/javascript">
								$("#low_deposit").val("${ low_deposit }");
							</script>
							
							<span class="mid">~</span>
							<div class="select_box pBox2">
								<div class="select">
		                            <select name="high_deposit" id="high_deposit" name="high_deposit" class="a_list region" title="select sDepositSt">
		                            	<option value="500">500</option>
		                            	<option value="1000">1000</option>
		                            	<option value="5000">5000</option>
		                            	<option value="10000">10000</option>
		                            	<option value="20000">20000</option>
		                            	<option value="30000">30000</option>
		                            	<option value="50000">50000</option>
	                                </select>
								</div>
							</div>
							<script type="text/javascript">
								$("#high_deposit").val("${ high_deposit }");
							</script>
							<div class="clr"></div>
						</div>
					</dd>
					<dd class="section section3">
						<strong><input type="checkbox" id="rent" name="rent"class="chk" value="월세" checked
						onClick="if(this.checked){low_rent.disabled=0; high_rent.disabled=0 }else{low_rent.disabled=1; high_rent.disabled=1}">
						월세로 찾기(단위/만원)</strong>
						<div class="pBoxBot">
							<div class="select_box pBox3">
								<div class="select">
	                                <select name="low_rent" id="low_rent" required onchange="changeRent(this);" class="a_list region" title="select sRentSt" >
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
							<div class="select_box pBox4">
								<div class="select">
		                             <select name="high_rent" id="high_rent" class="a_list region" title="select sRentSt">
		                             	<option value="0">0</option>
	                                	<option value="10">10</option>
	                                    <option value="30">30</option>
	                                    <option value="50">50</option>
	                                    <option value="100">100</option>
	                                    <option value="200">200</option>
	                                    <option value="300">300</option>
	                                 </select>
								</div>
								<script type="text/javascript">
								$("#high_rent").val("${ high_rent }");
							</script>
							</div>
						</div>
		
						<div class="clr"></div>
					</dd>
					<dd class="section section4">
						<strong>건물유형으로 찾기</strong>
						<div class="chkOpt">
						<c:forEach items="${btype }" var="bt">
							<c:if test="${ bt eq '오피스텔'}"><c:set var="bty1" value="${ bt }"/></c:if>
							<c:if test="${ bt eq '아파트' }"><c:set var="bty2" value="${ bt }"/></c:if>
							<c:if test="${ bt eq '빌라' }"><c:set var="bty3" value="${ bt }"/></c:if>
							<c:if test="${ bt eq '주택' }"><c:set var="bty4" value="${ bt }"/></c:if>
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
				</dl>
					<br><br>
					<input class="btnSearch11" type="submit" value="조회">
			</div>
				</form>
		</div>
	</body>
</html>