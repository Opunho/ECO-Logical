class Expense < ApplicationRecord
  belongs_to :account
  has_many :calculations
end
