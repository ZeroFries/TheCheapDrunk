require_relative ("Data.rb")
require_relative ("HTMLGenerator.rb")

# type "ruby Router.rb [category]"
# lists first 100 products of the category sorted by ppa
# categories:
# all
# beer
# wine
# whiskey
# gin
# vodka
# coolers
# cider
# rum

data = Info.new
category = ARGV[0].nil? ? "all" : ARGV[0].downcase
html = HTMLGen.new
html.header(category)
counter = 30

data.all_products.each do |product|
	break if counter == 0
	case category
	when "all"
		html.print_product(product)
		counter -= 1
	when "beer"
		if product.category_of_product == "Beer"
			html.print_product(product)
			counter -= 1
		end
	when "wine"
		if product.category_of_product == "Wine"
			html.print_product(product)
			counter -= 1
		end
	when "vodka"
		if product.subcategory_of_product == "Vodka"
			html.print_product(product)
			counter -= 1
		end
	when "whiskey"
		if product.subcategory_of_product == "Whisky/Whiskey"
			html.print_product(product)
			counter -= 1
		end
	when "cider"
		if product.subcategory_of_product == "Ciders"
			html.print_product(product)
			counter -= 1
		end
	when "rum"
		if product.subcategory_of_product == "Rum"
			html.print_product(product)
			counter -= 1
		end
	when "gin"
		if product.subcategory_of_product == "Gin"
			html.print_product(product)
			counter -= 1
		end
	when "coolers"
	  if product.subcategory_of_product == "Spirit Coolers"
	  	html.print_product(product)
			counter -= 1
	  end
	end
end

html.footer
html.print