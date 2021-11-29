class Expense < ApplicationRecord
  belongs_to :account
  has_one :emmission
  scope :many_months_ago, ->(time) { where(date: time.months.ago..Date.today) }
  scope :one_month_ago, ->(time) { where(date: time.month.ago..Date.today) }
  scope :date_filter, ->(time) { where(date: time.months.ago..Date.today)
                                 .or(where(date: time.month.ago..Date.today)) }

  def self.populate_chart(time)
    case time
    when "all"
      Expense.joins(:emmission).group("emmissions.sub_category").sum(:amount)
    when 1
      Expense.joins(:emmission).group("emmissions.sub_category")
             .one_month_ago(time).sum(:amount)
    else
      Expense.joins(:emmission).group("emmissions.sub_category")
             .many_months_ago(time).sum(:amount)
    end
  end

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
