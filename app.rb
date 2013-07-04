require 'sinatra'

def convert_cents_to_dollars(price)
	price = price.to_s
	if price.size == 3
		price[0,1] + "." + price[1,3]
	elsif price.size == 4
		price[0,2] + "." + price[2,4]
	end
end

def convert_to_percentage(alcohol)
	alcohol = alcohol.to_s
	if alcohol.size == 3
		alcohol[0,1] + "." + alcohol[1,3]
	elsif alcohol.size == 4
		alcohol[0,2] + "." + alcohol[2,4]
	end
	(alcohol.to_f / 100).to_s
end

def create_array(cat) # creates an array of beverages (a hash of properties)
	file = File.open "Beverages.txt", "r"
	counter = 0
	arr = []
	file.each_line do |line|
		if counter > 0
			contents = line.split("* ")
			hash = { name: contents[0], 
				price: convert_cents_to_dollars(contents[1]),
				thumb: contents[2], container: contents[3],
				alcohol: convert_to_percentage(contents[4]),
				alcoholPrice: convert_cents_to_dollars(contents[5]) }
			arr << hash
			counter -= 1
		end
    counter = 100 if line.include? "**#{cat}**"
  end
  arr
end

get '/' do
	erb :index
end

get '/all' do
	@cat = "all"
	@beverages = create_array @cat
	erb :show
end

get '/wine' do
	@cat = "wine"
	@beverages = create_array @cat
	erb :show
end

get '/beer' do
	@cat = "beer"
	@beverages = create_array @cat
	erb :show
end

get '/vodka' do
	@cat = "vodka"
	@beverages = create_array @cat
	erb :show
end

get '/whiskey' do
	@cat = "whiskey"
	@beverages = create_array @cat
	erb :show
end

get '/cider' do
	@cat = "cider"
	@beverages = create_array @cat
	erb :show
end

get '/coolers' do
	@cat = "coolers"
	@beverages = create_array @cat
	erb :show
end

get '/gin' do
	@cat = "gin"
	@beverages = create_array @cat
	erb :show
end

get '/rum' do
	@cat = "rum"
	@beverages = create_array @cat
	erb :show
end