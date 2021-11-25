class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :accounts
  has_many :expenses, through: :accounts
  has_many :emmissions, through: :expenses
  has_many :pledges

  def user_total_emmissions
    emmissions.collect(&:co2_grams).sum
  end

   def user_total_expenses
    expenses.collect(&:amount).sum
  end

  def unique_category
    emmissions.collect(&:main_category).uniq
  end

  def total_emmissions_per_category(cat)
     Emmission.where(main_category: cat).collect(&:co2_grams).sum
  end

    def total_expenses_per_category(cat)
     Emmission.where(main_category: cat).map do |emmission|
        emmission.expense.amount
     end.sum
  end

end
