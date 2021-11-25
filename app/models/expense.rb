class Expense < ApplicationRecord
  belongs_to :account
  has_one :emmission
end
