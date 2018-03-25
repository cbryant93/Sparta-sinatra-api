# Sparta-sinatra-api
Task was to find an API, and display information from the API onto a Sinatra web app. As well as this, tests need to be created based on the data parsed from the API.

# How to Run Tests
1. Go to https://github.com/cbryant93/Sparta-sinatra-api
2. Click on download file
3. In the terminal run 'rspec'
4. All 20 tests should run successfully showing green

# How to Run app
1. Go to https://github.com/cbryant93/Sparta-sinatra-api
2. Click on download file
3. In the terminal run 'rackup'
4. On you browser go to http://localhost:9292/ and enjoy

# Challenges

One one the main challenges on this task was displaying data from the API onto the web page. I wasn't sure how I would parse the ID of the specific beer into the GET method in the controller. I soon realised I was able to do it by doing the following:

```ruby
id = params[:id]
```
I would have to create an ID variable and parse through the ID taken from the specific beer the user clicks on in the Index page. I would then parse it into this:

```ruby
$single_response = @beerio.single_beer_service.single_beer_response(id)
```
Allowing me to call and display the information of the beer with that specific ID onto the page.
