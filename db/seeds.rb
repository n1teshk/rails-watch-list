require 'faker'

puts "Cleaning the database..."
Bookmark.destroy_all
List.destroy_all
Movie.destroy_all
puts "Database is empty"

puts "Creating fake movies..."
10.times do
  Movie.create!(
    title: Faker::Movie.unique.title,
    overview: Faker::Lorem.paragraph(sentence_count: 5),
    poster_url: Faker::Internet.url(host: 'image.tmdb.org'),
    rating: rand(1.0..10.0).round(1)
  )
end

puts "Created #{Movie.count} fake movies!"
