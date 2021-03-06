class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :accounts
  has_many :expenses, through: :accounts
  has_many :emmissions, through: :expenses
  has_many :pledges
  has_many :recommendations, through: :pledges

  def user_total_emmissions
    emmissions.collect(&:co2_grams).sum(&:to_f)
  end

  def user_total_expenses
    expenses.collect(&:amount).sum(&:to_f)
  end

  def unique_pledge
    recommendations = recommendations.collect(&:title).uniq
    recommendations.reject { |pledge| pledge.nil? }
  end

  def unique_category
    categories = emmissions.collect(&:sub_category).uniq
    categories.reject { |item| item.nil? }
  end

  def unique_account
    accounts.collect(&:account_number).uniq
  end

  def total_emmissions_per_category(cat)
    Emmission.where(sub_category: cat).collect(&:co2_grams).sum(&:to_i)
  end

  def total_expenses_per_category(array)
    case array[1]
    when "all"
      Emmission.where(sub_category: array[0]).map do |emmission|
        emmission.expense.amount
      end.sum
    else
      Emmission.filter_by_category(array[1], array[0]).map do |emmission|
        emmission.expense.amount
      end.sum
    end
  end

  def pledge_impact
    @completed_pledges = Pledge.where(completed: true)
    @total_co2_achieved = @completed_pledges.map{ |pledge| pledge.recommendation.co2_grams }.sum.to_f
  end
end
