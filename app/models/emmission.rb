class Emmission < ApplicationRecord
  belongs_to :expense
  has_many :impacts
end
