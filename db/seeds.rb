# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

User.create!(
  email: 'user@user.com',
  password: 'password',
  first_name: 'user',
  last_name: 'user'
)

5.times do
  @recommendation = Recommendation.create!(
    category: ["grocery", "household", "transportation", "food delivery", "fashion", "leiusure"].sample,
    title: ["Buy greener", "Its greener to be!","Save the Earth", "We love it green", "Why should be green","Dress to impres greener"].sample,
    description: ["We would like to improv e your green life by also helping our planet", "Becoming the green person that you always want to be, helping people around you getting more eco-friendly", "Its better to bike and its healty for you and its saving our planet","Green life is also good life, feel more free to help the planet" ].sample,
    link_to_article: ["https://homeguides.sfgate.com/ecofriendly-mean-78718.html","https://www.britishecologicalsociety.org/publications/journals/ecological-solutions-evidence/","https://www.conserve-energy-future.com/15-easy-ways-to-become-environmentally-friendly.php"].sample
  )
end
