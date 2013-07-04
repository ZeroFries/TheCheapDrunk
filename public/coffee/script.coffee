$ = jQuery
$(document).ready ->
	console.log "hi"
	$('button.show-more').bind "click", ->
		counter = 20
		$('.products > li').each (i, ele) ->
			if !$(ele).is(":visible") && counter > 0
				$(ele).show(800) 
				counter -= 1
		if counter > 0
			$('button.show-more').hide()

