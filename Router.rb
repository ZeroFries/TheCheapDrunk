require_relative ("Data.rb")
require_relative ("FileGen.rb")

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
file = FileGen.new
categories = ["all", "beer", "wine", "vodka", "whiskey", "cider", "rum", "gin", "coolers"]

categories.each do |category|
	counter = 100
	file.add_category category
	data.all_products.each do |product|
		break if counter == 0
		case category
		when "all"
			file.add_product product
			counter -= 1
		when "beer"
			if product.category_of_product == "Beer"
				file.add_product product
				counter -= 1
			end
		when "wine"
			if product.category_of_product == "Wine"
				file.add_product product
				counter -= 1
			end
		when "vodka"
			if product.subcategory_of_product == "Vodka"
				file.add_product product
				counter -= 1
			end
		when "whiskey"
			if product.subcategory_of_product == "Whisky/Whiskey"
				file.add_product product
				counter -= 1
			end
		when "cider"
			if product.subcategory_of_product == "Ciders"
				file.add_product product
				counter -= 1
			end
		when "rum"
			if product.subcategory_of_product == "Rum"
				file.add_product product
				counter -= 1
			end
		when "gin"
			if product.subcategory_of_product == "Gin"
				file.add_product product
				counter -= 1
			end
		when "coolers"
	  	if product.subcategory_of_product == "Spirit Coolers"
	  		file.add_product product
				counter -= 1
	  	end
		end
	end
end