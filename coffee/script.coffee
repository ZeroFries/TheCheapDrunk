$ = jQuery
$.fn.extend
	disableSelection: ->
		this.each ->
			if typeof this.onselectstart != 'undefined'
				this.onselectstart = -> false
			else if typeof this.style.MozUserSelect != 'undefined'
				this.style.MozUserSelect = 'none'
			else
				this.onmousedown = -> false

$(document).ready ->
	current_slide = null
	nextProdNum = 10
	totalProdNum = 30

	clickSlide= ->
		if current_slide != null
			current_slide.style.opacity = 1
			current_slide.style.left = 0
		unless current_slide==this
			current_slide = this
		else 
			current_slide = null
		if current_slide!=null
			$.data(current_slide, "x", event.pageX)
			current_slide.style.opacity = 0.5
			setTimeout(clearSlide, 1300)

	clearSlide= ->
		current_slide.style.opacity = 1 if current_slide!=null
		current_slide.style.left = 0 if current_slide!=null
		current_slide = null 

	products = document.getElementsByClassName 'product'
	$('div p').disableSelection()
	for i in [0..30]
		$(products[i]).height 150
		$(products[i]).width 900
		$(products[i]).bind 'click', {}, clickSlide
		$(products[i]).hide() if i >= nextProdNum

	$(document).mousemove (e) ->
		if current_slide!=null
			move = (e.pageX - $.data(current_slide, "x"))*1.5 #ad hoc move stretch
			current_slide.style.left = "#{move}px"
			if move > 1200
				#figure out how to disable mousemove temporarily if this is called
				nextProdNum++
				$(current_slide).unbind 'click'
				$(products[nextProdNum]).show('slow') unless nextProdNum >= totalProdNum
				$(products[i]).hide()
				setTimeout (->
  				$(current_slide).css("-webkit-transition-duration", "0")
				), 300
				setTimeout (-> 
					$(current_slide).slideUp "slow"
				), 300
				setTimeout (-> 
					current_slide = null
				), 305


	