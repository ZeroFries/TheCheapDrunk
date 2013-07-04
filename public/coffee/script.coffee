$ = jQuery
$(document).ready ->
	xOffset = 30;
	yOffset = 100;
	$('.products li').mousemove (e) ->
		parentOffset = $(this).offset()
		$(this).children('.tooltip')
			.css("top",(e.pageY - yOffset - parentOffset.top) + "px")
			.css("left",(e.pageX + xOffset - parentOffset.left) + "px")
	$('button.show-more').bind "click", ->
		counter = 20
		$('.products > li').each (i, ele) ->
			if !$(ele).is(":visible") && counter > 0
				$(ele).show(800) 
				counter -= 1
		if counter > 0
			$('button.show-more').hide()

