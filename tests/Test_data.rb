require "test/unit"
require_relative "../Data.rb"

class DataTest < Test::Unit::TestCase
	def setup
		@data = Info.new
	end

	def test_all_products_returns_array_of_products
	products = @data.all_products

		assert products.is_a?(Array)
		assert products.size > 50
	end

	def test_all_products_sorts_by_ppa
		product1 = @data.all_products[1]
		product2 = @data.all_products[5]

		assert product1.price_of_alcohol < product2.price_of_alcohol
	end

	def test_name_of_product_returns_name
		product = @data.all_products[1]

		assert_equal product.name_of_product.class, String
	end

	def test_category_of_product_returns_category
		product = @data.all_products[1]

		assert_equal product.category_of_product.class, String
	end
end