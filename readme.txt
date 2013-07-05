basic features:
list alcohol by price per alcohol (ppa) in litre (list all products by ppa)
sort by category (list all beers by ppa)

Overview:
Router/Data/FileGen handles the lcbo api
	-Router is the controller, telling Data which information to gather, and FileGen to store that information
	-Data is the model, responsabile for collecting info from the api
	-FileGen stores the information gained in a textfile -> Beverages.txt

app/views handles the actual web page
	-app is the controller, collecting information from Beverages.txt
	-views displays the information