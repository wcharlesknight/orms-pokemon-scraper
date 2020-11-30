require_relative "environment"



Scraper.new(@db).scrape

all_pokemon = @db.execute("SELECT * FROM pokemon;")

# test out your code here!
p all_pokemon
binding.pry
0