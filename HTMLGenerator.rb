# convert_cents_to_dollars

class HTMLGen

	def initialize
		@output = ""
	end

	def header(category)
		category = "alcohol" if category == "all"
		@output << "<!DOCTYPE html>\n<html>\n<head>\n    <title>The Cheap Drunk</title>\n    <link rel=\"stylesheet\" href=\"Style.css\" />\n    <link href='http://fonts.googleapis.com/css?family=Lily+Script+One|Pathway+Gothic+One' rel='stylesheet' type='text/css'>"+
		"\n    <script src=\'http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js\'></script>\n</head>\n<body>\n    <header>\n        <h1>The Cheap Drunk</h1>\n        <h2>The cheapest way to get drunk off #{category}." +
			" We've compiled a list of every single product in the LCBO and sorted them by the price of one litre of pure alcohol. If you're getting hammered in Ontario for less money, you're drinking Listerine." +
			"\n    </header>\n\n"
	end

	def print_product(product)
		@output << "    <div class=\"product\">\n        <img src=\"#{product.product_thumbnail}\" class=\"product_thumbnail\" alt=\"Beverage\">" +
			"\n        <p><h3>#{product.name_of_product}</h3>\n        <br>Price: $#{convert_cents_to_dollars product.price_of_product}" +
			"\n        <br>Size: #{product.amount_of_product}\n        <br>Price per litre of pure alcohol: $#{convert_cents_to_dollars product.price_of_alcohol}</p>"+
			"\n        <div class=\"hammered\">\n            <p>Cost of getting drunk <br>(~6 standard drinks): <br><strong>$#{convert_cents_to_dollars product.price_to_get_drunk}</strong>\n        </div>\n    </div>\n\n"
	end

	def footer
		@output << "\n    <script src=\'js/script.js\'></script>\n</body>\n</html>"
	end

	def print
		puts @output
	end

	private

		def convert_cents_to_dollars(price)
			price = price.to_s
			if price.size == 3
			  price[0,1] + "." + price[1,3]
			elsif price.size == 4
				price[0,2] + "." + price[2,4]
			end
		end
end