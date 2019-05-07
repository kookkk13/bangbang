<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<c:import url="../common/header.jsp"/>
		<link href="/bangbang/resources/package/fullcalendar/fullcalendar.css" rel="stylesheet"/>
		<link href="/bangbang/resources/package/fullcalendar/fullcalendar.print.css" rel="stylesheet" media="print"/>
		<script type="text/javascript" src="/bangbang/resources/package/fullcalendar/fullcalendar.js" charset="utf-8"></script>
		<script type="text/javascript" src="/bangbang/resources/package/fullcalendar/lang-all.js"></script>
		<script type="text/javascript" src="/bangbang/resources/package/bpopup/jquery.bpopup.min.js"></script>
		<script type="text/javascript">
	    $(function(){

	    	var today = new Date();
	    	var id = "${user.user_id}";
	    	var pro_no = "${pro_no}";
	    	var userid = "${sessionScope.loginMember.id}";
	    	
	    	//fullcalender
	    	$("#calender").fullCalendar({
	            defaultDate: today,
	            eventLimit: true,
				header: {
						left: "title",
						right: "today prev,next"
					},
				titleFormat: {
					month: "YYYY년 MMMM",
					week: "[yyyy] MMM dd일{ [yyyy] MMM dd일}",
					day: "yyyy년 MMM d일 dddd"
				},
				allDayDefault: false,
				defaultView: "month",
				monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
				monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
				dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
				dayNamesShort: ["일","월","화","수","목","금","토"],
				buttonText: {
					today : "오늘",
					month : "월별",
					week : "주별",
					day : "일별"
				},
	            eventLimit : true,
	            timeFormat: 'H:mm',
	            selectConstraint: {
	            	start: $.fullCalendar.moment().subtract(1, 'days'),
	            	end: $.fullCalendar.moment().startOf('year').add(100, 'year')
	           	},
	            events: function(start, end, timezone, callback){
	                $.ajax({
	                    url: "selectScheduler.do",
	                    type : 'post',
	                    data : {id: id},
	                    dataType: 'json',
	                    success: function(data){
	                    	var jsonStr = JSON.stringify(data);
			    			var json = JSON.parse(jsonStr);
	                    	
	                        var events = [];	//이벤트
	                        var parr = [];	 	//매물 번호 배열
	                        var check = [];		//매물 번호 중복 제거 배열
	                        var colors = ["#3a87ad", "#70C1B3", "#B2DBBF", "#B13C58", "#812C41", "#19536C"];	//색상 배열
	                        var newColor = "";
	                        
	                        for(var i in json.list){
	                        	var date = json.list[i].book_date.split(" ");
	                        	var pro_no = json.list[i].pro_no;
	                        	parr.push(pro_no);
	                        	
	                        	//매물 번호 중복 제거
	                        	check = parr.reduce(function(a,b){
	                        		if (a.indexOf(b) < 0)
	                        			a.push(b);
	                        		return a;
	                        	},[]);
	                        	
	                        	//매물 색상 추출
                            	for(var k=0; k<check.length; k++){
                                	if(pro_no == check[k]){
                                		newColor = colors[k];
                                	}
                            	}
	                        	
	                            events.push({
	                            	id: json.list[i].book_no,
	                            	groupId: pro_no,
	                                title: "매물 : " + pro_no + "\n예약자 : " + json.list[i].user_id,
	                                start: date[0] + " " + date[1],
	                                allDay: false,
									color: newColor
	                            });

	                        } //for
	                    	callback(events);
	                    } //success
	                    
	                }); //ajax
	                
	            }, //events
	            selectable: true,
	            //날짜 클릭시 날짜 정보 값 얻기
				select: function(date, allDay, jsEvent, view){
			    	   var yy = date.format("YYYY");
			    	   var mm = date.format("MM");
			    	   var dd = date.format("DD");
			    	   onchangeDay(yy,mm,dd);
			    },
	            
	     	    //이벤트에 상세보기
	            eventClick: function(event){
	            	var strid = event.title.substr(event.title.lastIndexOf(" ") + 1, event.title.length);
	            	var strno = event.title.substr(event.title.indexOf(":") + 2, event.title.lastIndexOf("\n") - 5);
	            	var strdate = event.start._i.substr(0, event.start._i.indexOf(" "));
	            	var strtime = event.start._i.substr(event.start._i.indexOf(" ") + 1, 5);
	            	
	            	console.log(strid);
	                  console.log(strno);
	                  console.log(strdate);
	                  console.log(strtime);
	            	
 	            	$.ajax({
	            		url: "selectInfo.do",
	            		type: 'post',
	            		data: {strid: strid},
	            		dataType: 'json',
	            		success: function(data){
	            			var jsonStr = JSON.stringify(data);
	            			var json = JSON.parse(jsonStr);
	            			
	    	            	$("#popup").css("background", event.color);
	    	            	$("#popup").html("<p class='add1'>매물 번호 : " + strno +
	    	            					 "</p><p class='add2'>예약일 : " + strdate +
	    	            					 "</p><p class='add3'>예약 시간 : " + strtime + 
	    	            					 "</p><p class='add4'>예약 ID : " + strid +
	    	            					 "</p><button class='close'>확인</button><div class='del'></div></div>");
	    	            	
	    	            	if(strid == id){
	    	            		$(".del").html("<button class='delete' value=" + event.id + ">삭제</button>");
	    	            	}
	    	            	
	            		},
						error: function(jqXHR, textstatus, errorthrown){
							console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
						}
	            		
	            	}); 
	            	
					$("#popup").bPopup({
						opacity: 0.6,
					}); 
					
                    return false; 
	            }
	            
	        }); //fullCalendar
	        
	        $("td[class^='fc-day fc-widget-content'][class$='fc-future']").html("<p class='res'>예약</p>");
	        $("td.fc-day").hover(function(){
	        	$(".res").css("display", "block");
	        });
	        
	        //예약 이벤트
		    function onchangeDay(year, month, day){
		    	//날짜 유효성 검사
		    	//if(today < year + month + day){
					$('#respopup').bPopup({
						opacity: 0.6
					});
			    	
				    $("#ok").click(function(){
				    	var time = $("#time").val();
				    	//시간 유효성 검사
				    	if(time > "09:59" && time < "19:01"){
				    		
					    	$.ajax({
					    		url: "insertScheduler.do",
					    		data: {year: year, month: month, day: day, time: time, userid: userid, id: id, pro_no: pro_no},
					    		type: "post",
					    		datatype: "json",
					    		success: function(data){
					    			if(data == "ok"){
					    				alert("방문 예약에 성공했습니다.");
					    				$("#calender").fullCalendar("refetchEvents");
					    			}else if(data == "no"){
					    				alert("이미 예약되어 있습니다. 다른 날짜 혹은 시간을 선택해주세요.");
					    			}else{
					    				alert("방문 예약에 실패했습니다.");
					    			}
					    			$("#respopup").bPopup().close();
					    		},
								error: function(jqXHR, textstatus, errorthrown){
									console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
								}
					    	}); //ajax
					    	
				    	}else{
				    		$(".notice").html("<label style='width: 324px; color: red;'>방문 예약시간은 AM 10:00 ~ PM 07:00 입니다.</label>");
				    	}
				    	
				    });
				    
		    	//}
			    
		    } //onchangeDay function
		    
		    $(document).on('click', '.close', function(){
		    	$("#popup").bPopup().close();
		    });
		    
		    //이벤트 삭제 
		    $(document).on('click', '.delete', function(){
		    	var book_no = $(".delete").val();
		    	
 		    	$.ajax({
		    		url: "deleteScheduler2.do",
		    		type: 'post',
		    		data: {book_no: book_no},
		    		success: function(data){
		    			if(data == "ok"){
		    				alert("예약 삭제에 성공했습니다.");
		    				$("#calender").fullCalendar("refetchEvents");
		    			}else{
		    				alert("예약 삭제에 실패했습니다.");
		    			}
		    			$("#popup").bPopup().close();
		    			
		    		},
					error: function(jqXHR, textstatus, errorthrown){
						console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
					}
		    	});

		    });
	    
	    }); //document.ready
		</script>
		<style type="text/css">
			#calendar {
				width: 90%;
				font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
				font-size: 14px;
				-ms-overflow-style: none;
			}
			::-webkit-scrollbar {
				display:none;
			}
			.fc-day-number.fc-sat.fc-future { color: #0000FF; }
			.fc-day-number.fc-sun.fc-future { color: #FF0000; }
			.fc-day-number.fc-sat.fc-past { color: #0000FF; } /* 토요일  */
    		.fc-day-number.fc-sun.fc-past { color: #FF0000; } /* 일요일 */
    		.fc-left { 
    			font-size: 20px;
    			margin-left: 10px;
    		}
    		.fc-day.fc-widget-content:hover { 
    			background-color: #e0ecf7;
    		}
    		.fc-unthemed .fc-today {
  				background: #c0d6e8 !important;
			}
			.fc-unthemed .fc-today .res { display: none !important; }
			#popup, #respopup{
				position: absolute;
				top: 50%;
				left: 50%;
				width: 500px;
				height: 350px;
				margin: -50px 0 0 -50px;
				background: #FFFFFF;
			}
			.fc-time { margin-right: 10px; }
			.fc-day-grid-event .fc-content { font-size: 15px !important; }
			td.fc-day :hover{
				cursor: pointer;
			}
			.res {
				text-align: center;
				line-height: 650%;
				color: white;
				font-size: 25px !important;
				display: none;
			}
			.fc-time { margin-right: 10px; }
			.fc-day-grid-event .fc-content { font-size: 15px !important; }
			.popup { border-radius: 20px; }
			p.add1 {
				color: #FFFFFF;
				text-align: center;
				font-size: 17px;
				margin-top: 40px;
			}
			p.add2 {
				color: #FFFFFF;
				text-align: center;
				font-size: 17px;
			}
			p.add3 {
				color: #FFFFFF;
				text-align: center;
				font-size: 17px;
			}
			p.add4 {
				color: #FFFFFF;
				text-align: center;
				font-size: 17px;
			}
			.fc-content:hover { cursor: pointer; }
		</style>
	</head>
	<body>
		<c:import url="../common/top.jsp"/>
		<div id="member-info">
			<div class="prodLitArea myInfoArea">
				<div class="myInfoWrap">
					<div class="myInfoTitBox">
						<strong>방문 예약</strong>
					</div>
					<div class="myContent">
						<h2 class="myInfoTit"><span>${user.user_name}</span></h2>
					</div>
					<!-- 캘린터 -->
					<div id="calender">
					</div>
					<!-- 예약 팝업 -->
					<div id="respopup" style="display: none;">
						<div id="" class="joinPopup">
							<div class="memberBox memJoinBox">
								<h2 class="memTit joinTit">방문 예약</h2>
								<div class="join_form">
									<form name="joinForm" id="joinForm" method="post" action="">
									<ul>
										<li style="margin-top: 40px;">
											<label for="join-name">예약 시간</label>
											<input type="time" id="time" name="time" min="10:00" max="19:00" value="12:00" step="3600" style="width:200px;" required/>
										</li>
										<li class="notice">
										</li>
									</ul>
									<input type="button" class="btnJoin trans-300" id="ok" style="width: 150px; margin-top: 70px;" value="확인">
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- 이벰트 팝업 -->
					<div id="popup" class="popup">
					</div>
				</div>
			</div>
		</div>
	</body>
</html>