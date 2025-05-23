
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

puts "Cleaning up database..."
Movie.destroy_all
puts "Database cleaned."

puts "Creating fake movies..."

20.times do
  Movie.create!(
    title: Faker::Movie.unique.title,
    overview: Faker::Lorem.paragraph(sentence_count: 3),
    poster_url: "https://picsum.photos/200/300?random=#{rand(1000)}",
    rating: rand(1.0..10.0).round(1)
  )
end

puts "Finished creating movies!"
