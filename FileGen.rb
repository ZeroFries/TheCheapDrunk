class FileGen
	def initialize
		@file = File.open "Beverages.txt", "w"
	end

	def add_category(cat)
		@file.write "\n\n**#{cat}**"
	end

	#write in file the product name, price, thumbnail, container, amount of alcohol, and price of alcohol
	def add_product(prod)
		@file.write "\n#{prod.name_of_product}* #{prod.price_of_product}* #{prod.product_thumbnail}* #{prod.amount_of_product}* #{prod.amount_of_alcohol}* #{prod.price_of_alcohol}* "
	end
end