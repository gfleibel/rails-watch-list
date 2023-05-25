require 'json'
require 'open-uri'

url = 'https://tmdb.lewagon.com/movie/top_rated'
html_content = URI.open(url).read
json_content = JSON.parse(html_content)
json_content_results = json_content["results"]

puts "Cleaning database..."
Movie.destroy_all

puts "Creating movies..."

json_content_results.each do |result|
  Movie.create(title: result["title"], overview: result["overview"], poster_url: "https://image.tmdb.org/t/p/original#{result["poster_path"]}", rating: result["vote_average"])
end

puts "Created #{Movie.all.count}"

puts "Finished seeding."


puts "Now lets seed some lists..."
puts "Cleaning database..."
List.destroy_all

puts "Creating lists..."

List.create(name: "Classic" )
List.create(name: "Sci-Fi" )
List.create(name: "Suspense/Terror" )
List.create(name: "Comedy" )
List.create(name: "Romance" )
List.create(name: "Action" )
List.create(name: "Fantasy" )

puts "Created #{List.all.count}"

puts "Finished seeding."
