# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# movie
puts "Deleting previous #{Movie.count} movie(s)"
Movie.destroy_all
puts "Finished deleting"

puts "Adding new movies"

movies = JSON.parse(URI.open("http://tmdb.lewagon.com/movie/top_rated").read)
movies = movies["results"]

movies.each do |movie|
  new_movie = Movie.create(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}",
    rating: movie["vote_average"]
  )

  puts "Adding #{new_movie.id} - #{new_movie.title}"
end

puts "Finished adding, #{Movie.count} movie(s) have been added."

# List
# puts ""
# puts "-------------------------------"
# puts ""

# puts "Deleting previous #{List.count} list(s)"
# List.destroy_all
# puts "Finished deleting"

# puts "Adding new lists"

# List.create(name: "Comedy")
# List.create(name: "Classic")

# puts "Finished adding, #{List.count} list(s) have been added."
