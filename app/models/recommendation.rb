class Recommendation < ApplicationRecord
  has_many :impacts
  has_many :pledges
end
