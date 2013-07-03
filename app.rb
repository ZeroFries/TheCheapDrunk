require 'sinatra'

# index
def create_array(cat)
	file = File.open "Beverages.txt", "r"
	counter = 0
	arr = []
	file.each_line do |line|
		if counter > 0
			contents = line.split("* ")
			hash = { name: contents[0], price: contents[1], thumb: contents[2], container: contents[3], alcohol: contents[4], alcoholPrice: contents[5] }
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