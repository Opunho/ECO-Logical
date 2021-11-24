# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Calculation.destroy_all
Expense.destroy_all
Emmission.destroy_all
Account.destroy_all
User.destroy_all

@user = User.create!(
  email: 'user@user.com',
  password: 'password',
  first_name: 'user',
  last_name: 'user'
)
puts "User created"

puts "Creating Account"
@account = Account.create!(
  name: "ING",
  account_number: "NL03 INGX 8976 9485 99",
  user_id: @user.id
)
puts "Account created"

puts "Creating Expense"
3.times do
  i = 0
    @expense = Expense.create!(
      category: ["Groceries", "Housing", "Leisure"].sample,
      creditor_name: ["AH", "Vattenfall", "Netflix"].sample,
      amount: [250, 8, 100].sample,
      currency:"EUR",
      date: "",
      external_id: "#{i}",
      creditor_id: "#{i}",
      account_id: @account.id
    )
  i += 1

puts "Expense created"

puts "Creating Emmission"


  @emmission = Emmission.create!(
    main_category: ["Groceries", "Housing", "Leisure"].sample,
    sub_category: ["Supermarket", "Entertainment", "Energy"].sample,
    co2_grams: [1000, 20, 340].sample,
    mcc: "#{i}"
  )


puts "Emmission created"

puts "Creating Calculation"
@calculation = Calculation.create!(
  total_expenses: @expense.amount,
  total_emmissions: @emmission.co2_grams,
  emmission_id: @emmission.id,
  expense_id: @expense.id
)
end
puts "Calculation created"

puts "Creating Recommendations"
5.times do
  @recommendation = Recommendation.create!(
    category: ["grocery", "household", "transportation", "food delivery", "fashion", "leiusure"].sample,
    title: ["Buy greener", "Its greener to be!","Save the Earth", "We love it green", "Why should be green","Dress to impres greener"].sample,
    description: ["We would like to improv e your green life by also helping our planet", "Becoming the green person that you always want to be, helping people around you getting more eco-friendly", "Its better to bike and its healty for you and its saving our planet","Green life is also good life, feel more free to help the planet" ].sample,
    link_to_article: ["https://homeguides.sfgate.com/ecofriendly-mean-78718.html","https://www.britishecologicalsociety.org/publications/journals/ecological-solutions-evidence/","https://www.conserve-energy-future.com/15-easy-ways-to-become-environmentally-friendly.php"].sample
  )
end

5.times do
  user_id = @user.id
  recommendation_id = rand(1..5)
  @pledge = Pledge.create!(
    completed: false,
    user_id: user_id,
    recommendation_id: recommendation_id
  )
end
