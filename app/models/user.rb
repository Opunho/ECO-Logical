class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :accounts
  has_many :expenses, through: :accounts
  has_many :calculations, through: :expenses
  has_many :pledges

  def user_total_emmissions
    calculations.collect(&:total_emmissions).sum
  end

   def user_total_expenses
    calculations.collect(&:total_expenses).sum
  end

  def unique_category
    calculations.collect(&:emmission).collect(&:main_category).uniq
  end

  def total_per_category
    total = {}
    unique_category.each do |cat|
      emmission_group_per_category = Emmission.where(main_category: cat)
      sum = 0
      emmission_group_per_category.each do |emmission|
        sum += emmission.co2_grams
        total.merge!("#{cat}" => sum)
      end
    end
    total
  end


end
