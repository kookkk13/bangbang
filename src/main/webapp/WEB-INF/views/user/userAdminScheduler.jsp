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
		    	var id = "${sessionScope.loginMember.id}";
		    	
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
				    timeFormat: 'H:mm',
		            events: function(start, end, timezone, callback){
		                $.ajax({
		                    url: "selectScheduler.do",
		                    type: 'post',
		                    data: {id: id},
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
		                                start: date[0] + "\n" + date[1],
		                                allDay: false,
										color: newColor
		                            });

		                        } //for
		                        callback(events);
		                    } //success
		                    
		                }); //ajax
		                
		            }, //events
		            
		     	    //이벤트에 상세보기
		            eventClick: function(event){
		            	var strid = event.title.substr(event.title.lastIndexOf(" ") + 1, event.title.length);
		            	var strno = event.title.substr(event.title.indexOf(":") + 2, event.title.lastIndexOf("\n") - 5);
		            	var strdate = event.start._i.substr(0, event.start._i.indexOf("\n"));
		            	var strtime = event.start._i.substr(event.start._i.indexOf("\n") + 1, 5);
		            	console.log(event);
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
		    	            					 "</p><p class='add5'>이름 : " + json.name + 
		    	            					 "</p><p class='add6'>이메일 : " + json.email + 
		    	            					 "</p><p class='add7'>연락처 : " + json.phone + 
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
		        
			    $(document).on('click', '.close', function(){
			    	$("#popup").bPopup().close();
			    });
		        
		    });
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
			#popup {
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
			.popup { border-radius: 10px; }
			p.add1 {
				color: #FFFFFF;
				text-align: center;
				line-height: 100px;
				font-size: 20px;
			}
			p.add2 {
				color: #FFFFFF;
				text-align: center;
				font-size: 20px;
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
			p.add5 {
				color: #FFFFFF;
				text-align: center;
				font-size: 17px;
			}
			p.add6 {
				color: #FFFFFF;
				text-align: center;
				font-size: 17px;
			}
			p.add7 {
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
						<strong>일정 관리</strong>
					</div>
					<div class="myContent">
						<h2 class="myInfoTit"><span>일정 관리</span></h2>
					</div>
					<!-- 캘린터 -->
					<div id="calender">
					</div>
					<!-- 이벰트 팝업 -->
					<div id="popup" class="popup">
					</div>
				</div>
			</div>
		</div>
	</body>
</html>