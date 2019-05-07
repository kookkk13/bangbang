/*
 * 2016.12.08 kim hee sung
 */
(function() {

	$.eum = $.extend(this, {

		calendar : {
			option : {
				prevBtn			: null,
				nextBtn			: null,
				target			: null,
				todayDate		: new Date().toISOString().substr(0, 10).replace('T', ' '),
				defaultDate		: new Date().toISOString().substr(0, 10).replace('T', ' '),
				selectDate		: new Date().toISOString().substr(0, 10).replace('T', ' '),
				calendarHtml	: function() {

					// 달력 그리기
					var html = '' +
						'<div class="calendarBox">' + 
						'	<div class="calendarHeader">' +
						'		<span>북구 > 복현1A1B</span>' + 
						'	</div>' + 
						'	<div class="calendarContents">' +
						'	</div>' + 
						'	<div class="calendarFooter">' +
						'		<a href="javascript:void(0);" class="btnAll"><span>전체</span></a>' + 
						'		<a href="javascript:void(0);" class="btnApply"><span>적용</span></a>' + 
						'		<a href="javascript:void(0);" class="btnDown"><span>다운</span></a>' + 
						'		<a href="javascript:void(0);" class="btnDelete"><span>삭제</span></a>' + 
						'		<a href="javascript:void(0);" class="btnCancel"><span>취소</span></a>' + 
						'	</div>' + 
						'</div>';

					return html;
				},
				events			: null,
				btnAll			: function(e) {
					
					var option = e.data;
					option.target.val('전체');
					option.target.attr('rvalue', 'all');
					$(this).closest('.calendarBox').hide();

				},
				btnDown			: function(e) { },
				btnDelete		: function(e) { },
				btnApply		: function(e) {
					
					var option = e.data;

					option.defaultDate = option.selectDate;
					if(option.todayDate == option.defaultDate) {
						option.target.val('오늘 : ' + option.defaultDate.replace(/-/gi, '.'));
					} else {
						option.target.val('선택 : ' + option.defaultDate.replace(/-/gi, '.'));
					}
					option.target.attr('rvalue', option.defaultDate);
					$(this).closest('.calendarBox').hide();

					$.eum.calendar.option.btnAppleAfter(e);

				},
				btnApplyAfter	: function(e) {

				},
				btnCancel		: function(e) {
					
					var option = e.data;

					option.selectDate = option.defaultDate;
					$(this).closest('.calendarBox').find('.calendarContents').fullCalendar('gotoDate', option.selectDate);
					$(this).closest('.calendarBox').find('.calendarContents').find('[data-date]').removeClass('fc-state-highlight');
					$(this).closest('.calendarBox').find('.calendarContents').find('[data-date=' + option.selectDate + ']').addClass('fc-state-highlight');
					$(this).closest('.calendarBox').hide();
				},
				onBeforShowEvent : function() { }
			},
			picker : function(option) {

				// 옵션설정
				option = $.extend($.eum.calendar.option, option);

				// 달력폼추가
				option.target.after(option.calendarHtml());
				var target = option.target.next();

				// 전체날짜
				if(option.defaultDate == 'all') {
					option.defaultDate = option.todayDate;
				}

				// 달력이벤트 추가
				target.find('.calendarContents').fullCalendar({
					header		: {
						left	: 'prevYear,prev',
						center	: 'title',
						right	: 'next,nextYear'
					},
					footer		: {
						left	: '',
						center	: '',
						right	: 'today'
					},
					defaultDate	: option.defaultDate,
					locale		: 'ko',
					editable	: false,
					navLinks	: false,
					eventLimit	: false, 
					dayClick	: function(date, jsEvent, view, resourceObj) {
						option.selectDate = date.format('YYYY-MM-DD');
						$(this).closest('.calendarBox').find('[data-date]').removeClass('fc-state-highlight');
						$(this).closest('.calendarBox').find('[data-date=' + option.selectDate + ']').addClass('fc-state-highlight');
					},
					viewRender: function (view, element) {
						$(element).find('[data-date]').removeClass('fc-state-highlight');
						$(element).find('[data-date=' + option.selectDate + ']').addClass('fc-state-highlight');
						$(element).find('.fc-today-button').attr('disabled', false);
					},
					events : option.events
				}); 

				// 오늘 버튼 이벤트
				target.find('.fc-today-button').click(function() {
					option.selectDate = option.todayDate;
					$(this).closest('.calendarBox').find('[data-date]').removeClass('fc-state-highlight');
					$(this).closest('.calendarBox').find('[data-date=' + option.selectDate + ']').addClass('fc-state-highlight');
				});

				// 전체 버튼 이벤트
				target.find('a.btnAll').click(option, option.btnAll);

				// 적용 버튼 이벤트
				target.find('a.btnApply').click(option, option.btnApply);

				// 취소 버튼 이벤트
				target.find('a.btnCancel').click(option, option.btnCancel);

				// 다운 버튼 이벤트
				target.find('a.btnDown').click(option, option.btnDown);

				// 삭제 버튼 이벤트
				target.find('a.btnDelete').click(option, option.btnDelete);

				// 사용자가 추가한 이전 버튼
				if(option.prevBtn != null) {
					$(option.prevBtn).click(function() {

						// 1일 이전 날짜
						var date = new Date(option.defaultDate);
						date.setDate(date.getDate() - 1);
						option.selectDate = date.toISOString().substr(0, 10).replace('T', ' ');

						option.target.next().show();
						option.target.next().find('.calendarContents').fullCalendar('gotoDate', option.selectDate);
						option.target.next().find('.calendarContents').find('[data-date]').removeClass('fc-state-highlight');
						option.target.next().find('.calendarContents').find('[data-date=' + option.selectDate + ']').addClass('fc-state-highlight');

						option.defaultDate = option.selectDate;
						if(option.todayDate == option.defaultDate) {
							option.target.val('오늘 : ' + option.defaultDate.replace(/-/gi, '.'));
						} else {
							option.target.val('선택 : ' + option.defaultDate.replace(/-/gi, '.'));
						}
						option.target.attr('rvalue', option.defaultDate);
						option.target.next().hide();
					});
				}

				// 사용자가 추가한 다음 버튼
				if(option.nextBtn != null) {
					$(option.nextBtn).click(function() {

						// 1일 이전 날짜
						var date = new Date(option.defaultDate);
						date.setDate(date.getDate() + 1);
						option.selectDate = date.toISOString().substr(0, 10).replace('T', ' ');

						option.target.next().show();
						option.target.next().find('.calendarContents').fullCalendar('gotoDate', option.selectDate);
						option.target.next().find('.calendarContents').find('[data-date]').removeClass('fc-state-highlight');
						option.target.next().find('.calendarContents').find('[data-date=' + option.selectDate + ']').addClass('fc-state-highlight');

						option.defaultDate = option.selectDate;
						if(option.todayDate == option.defaultDate) {
							option.target.val('오늘 : ' + option.defaultDate.replace(/-/gi, '.'));
						} else {
							option.target.val('선택 : ' + option.defaultDate.replace(/-/gi, '.'));
						}
						option.target.attr('rvalue', option.defaultDate);
						option.target.next().hide();
					});
				}

				// 달력 열기/닫기 이벤트 추가
				option.target.click(function() {
					var display = target.css('display');
					if(display == 'none') { 
						// 달력 열기 이전 이벤트
						option.onBeforShowEvent(target);
					}

					target.toggle();	
				});
				
				// 기본 숨김
				target.hide();
			}
		}

	});
})(jQuery);
