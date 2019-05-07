/*
 * 2016.12.08 kim hee sung
 */
(function() {
	$.eum = $.extend(this, {
		common		: {
			onTextFormat : function() {
				$(function() {
					var cnt = $('input[text-format]').length;
					if(cnt <= 0) { return; }
					$('input[text-format]').each(function() {
						var format = $(this).attr('text-format');
						if(format == 'number') {
							$(this).keyup(function() {
								var text = $(this).val();
									text = text.replace(/[^0-9]/g, '');
								$(this).val(text);
							});
						} else if(format == 'hp') {
							$(this).keyup(function() {
								var text = $(this).val();
									text = text.replace(/[^0-9]/g, '');
									text = text.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
								$(this).val(text);
							});
						}
					});
				});
			},
			formData : function(form) {
				var formData	= form.serializeArray(); 
				var data		= {};
				$.map(formData, function(n, i){
					data[n.name] = n.value;
				});
				return data;
			},
			getByteLang : function(text) {

				var byteLength	= 0;
				var	lsEsc		= "%B2%B3%B4%B7%A8%AD%B1%D7%F7%B0%A7%B8%A1%BF%A4%B6%AE%C6%D0%AA%3F%3F%D8%BA%DE%BD%BC%BE%E6%F0%F8%DF%FE%B9";

				for (var i = 0; i < text.length; i++)
				{
					var oneChar = escape(text.charAt(i));

					if (oneChar.length == 1 )
					{
						byteLength ++;
					}
					else if (oneChar.indexOf("%u") != -1)
					{
						byteLength += 2;
					}
					else if (oneChar.indexOf("%") != -1)
					{
						if(lsEsc.indexOf(oneChar) != -1)
						{
							byteLength += 2;
						}
						else
						{
							byteLength += oneChar.length / 3;
						}
					}
				}

				return byteLength;

			},
			getByteCut : function(text, max) {

				var byteText	= '';
				var byteLength	= 0;
				var	lsEsc		= "%B2%B3%B4%B7%A8%AD%B1%D7%F7%B0%A7%B8%A1%BF%A4%B6%AE%C6%D0%AA%3F%3F%D8%BA%DE%BD%BC%BE%E6%F0%F8%DF%FE%B9";

				for (var i = 0; i < text.length; i++)
				{
					var oneChar = escape(text.charAt(i));


					if (oneChar.length == 1 )
					{
						byteLength ++;
					}
					else if (oneChar.indexOf("%u") != -1)
					{
						byteLength += 2;
					}
					else if (oneChar.indexOf("%") != -1)
					{
						if(lsEsc.indexOf(oneChar) != -1)
						{
							byteLength += 2;
						}
						else
						{
							byteLength += oneChar.length / 3;
						}
					}

					if(byteLength > max) { break; }

					byteText += text.charAt(i);

				}

				return byteText;

			}
		},
		script		: {
			scriptList	: [],
			onLoad		: function() {
				// 현재 보유중인 스크립트
				$('script[src]').each(function() {
					$.eum.script.scriptList.push($(this).attr('src'));
				});
			},
			onAdd		: function(scriptUrl) {
				var scriptUrlMax = scriptUrl.length;
				for(var i=0;i<scriptUrlMax;i++) {
					if($.inArray(scriptUrl[i], $.eum.script.scriptList) >= 0) { continue; }
					$.ajax({ 
						url			: scriptUrl[i],
						dataType	: 'script', 
						cache		: true,
						async		: false
					});
					$.eum.script.scriptList.push(scriptUrl[i]);		
				}
			}
		}
	});
	$.eum.common.onTextFormat();
	$.eum.script.onLoad();
})(jQuery);


