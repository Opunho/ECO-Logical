class Expense < ApplicationRecord
  belongs_to :account
  has_one :emmission

  scope :last_thirty_days, -> { where(date: 31.days.ago..Date.today) }
  scope :last_six_months, -> { where(date: 6.months.ago..Date.today) }
  scope :last_three_months, -> { where(date: 3.months.afo..Date.today) }
  scope :pie_chart, -> { group(:creditor_id).count }

  def sub_category
    sub_cat = []
    emmission = Emmission.new
    emmission.calculator.each do |element|
      sub_cat << element[:category][:subCategory]
    end
    sub_cat.uniq
  end

  def self.chart_legend
    Expense.joins(:emmission).group("emmissions.sub_category").sum("amount")
  end

  def emmission_data(sub_category)
    emmission = Emmission.new
    emmission.calculator.each do |element|
      return element[:mcc] if element[:category][:subCategory] == sub_category
    end
  end
end
