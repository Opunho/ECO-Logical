# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Recommendation.destroy_all
User.destroy_all

puts "Creating user"
@user = User.create!(
  email: 'user@user.com',
  password: 'password',
  first_name: 'user',
  last_name: 'user'
)
puts "User created"

puts "Creating Recommendations"
Recommendation.create!(
  category: "Transportation",
  title: "Go carless for a week",
  description: "Going carless for a year could save about 2.6 tons of carbon dioxide, according to 2017 study from researchers at Lund University and the University of British Columbia — that’s a little more than a roundtrip transatlantic flight. How can you stop using a car? Try taking a train, bus or better yet, ride a bike.",
  link_to_article: "https://www.nytimes.com/guides/year-of-living-better/how-to-reduce-your-carbon-footprint",
  co2_grams: 50000
)
