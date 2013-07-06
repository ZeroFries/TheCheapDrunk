require 'sinatra'

def convert_cents_to_dollars(price)
	price = price.to_s
	dig = price.size - 2
	price[0,dig] + "." + price[dig,dig+2]
end

def convert_to_percentage(alcohol)
	alcohol = alcohol.to_s
	dig = alcohol.size - 2
	alcohol[0,dig] + "." + alcohol[dig,dig+2]
	(alcohol.to_f / 100).to_s
end

def create_array(cat) # creates an array of beverages (a hash of properties)
	file = File.open "Beverages.txt", "r"
	counter = 0
	arr = []
	file.each_line do |line|
		counter = 0 if line.size < 10 && counter > 0 # ad hoc way of cutting the counter if there's less than 100 entries
		if counter > 0
			contents = line.split("* ")
			hash = { name: contents[0], 
				price: convert_cents_to_dollars(contents[1]),
				thumb: contents[2], 
				container: contents[3],
				alcohol: convert_to_percentage(contents[4]),
				alcoholPrice: convert_cents_to_dollars(contents[5]),
				id: contents[6] }
			arr << hash
			counter -= 1
		end
    counter = 100 if line.include? "**#{cat}**" #reads up to 100 beverages
  end
  arr
end

categories = ["all", "beer", "wine", "vodka", "whiskey", "cider", "rum", "gin", "coolers"]

# create methods which handle get requests for each of the categories
categories.each do |category|
	get "/#{category}" do
		@cat = category
		@beverages = create_array category
		erb :show
	end
end