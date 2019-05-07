/*
 * 2016.12.08 kim hee sung
 */
(function() {
	$.eum = $.extend(this, {
		selectStyle : {
			onLoad : function() {
				$(function() {
					$.eum.selectStyle.onRun();
				});
			},
			onRun : function() {

				// Common
				var select_root		= $('div.select');
				var select_value	= $('.my_value');
				var select_a		= $('div.select>ul>li>a');

				select_root.off();
				select_value.off();
				select_a.off();
				
				// Radio Default Value
				$('div.my_value').each(function(){
					var default_value = $(this).next('.i_list').find('input[checked]').next('label').text();
					$(this).append(default_value);
				});
				
				// Line
				select_value.bind('focusin',function(){$(this).addClass('outLine')});
				select_value.bind('focusout',function(){$(this).removeClass('outLine')});
				
				// Show
				function show_option(){
					$(this).parents('div.select:first').toggleClass('open');
				}
				
				// Hover
				function i_hover(){
					$(this).parents('ul:first').children('li').removeClass('hover');
					$(this).parents('li:first').toggleClass('hover');
				}
				
				// Hide
				function hide_option(){
					var t = $(this);
					setTimeout(function(){
						t.parents('div.select:first').removeClass('open');
					}, 1);
				}
				
				// Set Input
				function set_label(){
					var v = $(this).next('label').text();
					$(this).parents('ul:first').prev('.my_value').text('').append(v);
					$(this).parents('ul:first').prev('.my_value').addClass('selected');
				}
				
				// Set Anchor
				function set_anchor(){
					var text	= $(this).text();
					var value	= $(this).attr('value');
					$(this).parents('ul:first').prev('.my_value').text('').append(text);
					$(this).parents('ul:first').prev('.my_value').attr('value', value);
					$(this).parents('ul:first').prev('.my_value').addClass('selected');
				}

				// Anchor Focus Out
//				$('*:not("div.select a")').focus(function(){
//					$('.a_list').parent('.select').removeClass('open');
//				});
						
				select_value.click(show_option);
				select_root.removeClass('open');
				select_root.mouseleave(function(){$(this).removeClass('open')});
				select_a.click(set_anchor).click(hide_option).focus(i_hover).hover(i_hover);

			}
		}
	});
	$.eum.selectStyle.onLoad();
})(jQuery);


