# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Account.destroy_all
Expense.destroy_all
Emmission.destroy_all
Calculation.destroy_all

puts "Creating User"
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
end
puts "Expense created"

puts "Creating Emmission"
3.times do
  i = 0
  @emmission = Emmission.create!(
    main_category: ["Groceries", "Housing", "Leisure"].sample,
    sub_category: ["Supermarket", "Entertainment", "Energy"],
    co2_grams: [1000, 20, 340],
    mcc: "#{i}"
  )
  i += 1
end
puts "Emmission created"

puts "Creating Calculation"
@calculation = Calculation.create!(
  total_expenses: @expense.amount,
  total_emmissions: @emmission.co2_grams,
  emmission_id: @emmission.id,
  expense_id: @expense.id
)
puts "Calculation created"
