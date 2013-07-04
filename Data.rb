require 'json'
require 'open-uri'

class Info
	FINALPAGE = 42

	def initialize
		@parsed_data = []
		1.upto(FINALPAGE) do |i|
		  url = "http://lcboapi.com/products?page=#{i}"
		  raw_data = open(url).read
		  break if (raw_data)["result"].nil?
		  @parsed_data += JSON.parse(raw_data)["result"]
		end
		products_delete
		products_sort
	end

	def all_products
		@parsed_data
	end

	def products_sort
		@parsed_data.sort_by! do |beverage|
			beverage.price_of_alcohol
		end
	end

	def products_delete
		@parsed_data.each do |beverage|
			@parsed_data.delete(beverage) if beverage.price_of_alcohol.nil? 
		end
	end
end

class Hash
	def category_of_product
		self["primary_category"]
	end

	def subcategory_of_product
		self["secondary_category"]
	end

	def name_of_product
		self["name"]
	end

	def product_thumbnail
		self["image_thumb_url"]
	end

	def product_image
		self["image_url"]
	end

	def price_of_product
		self["regular_price_in_cents"]
	end

	def amount_of_alcohol
		self["alcohol_content"]
	end

	def price_of_alcohol
		return nil if self["price_per_liter_of_alcohol_in_cents"]<1 # ad hoc way of getting rid of empty entries
		self["price_per_liter_of_alcohol_in_cents"]*10.to_i
	end

	def amount_of_product
		self["package"]
	end

	def price_to_get_drunk
		self.price_of_alcohol / 8
	end

	def product_id
		self["id"]
	end
end