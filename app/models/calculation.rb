class Calculation < ApplicationRecord
  belongs_to :emmission
  belongs_to :expense
  has_many :impacts
end
