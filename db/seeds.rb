# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'open-uri'
require 'json'

Movie.destroy_all
url = "http://tmdb.lewagon.com/movie/top_rated"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

movies["results"].each do |movie|
  url = "https://image.tmdb.org/t/p/w500"+ movie["poster_path"]
  Movie.create(
    title: movie["original_title"],
    overview: movie["overview"],
    poster_url: url,
    rating: movie["vote_average"]
  )
end

# original_title
# overview
# poster_path : "https://image.tmdb.org/t/p/w500"+ poster_path
# vote_average
