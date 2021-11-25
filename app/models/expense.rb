class Expense < ApplicationRecord
  belongs_to :account
  has_one :emmission

  def sub_category
    sub_cat = []
    emmission = Emmission.new
    emmission.calculator.each do |element|
      sub_cat << element[:category][:subCategory]
    end
    sub_cat.uniq
  end

  def emmission_data(sub_category)
    emmission = Emmission.new
    emmission.calculator.each do |element|
      return element[:mcc] if element[:category][:subCategory] == sub_category
    end
  end
end
