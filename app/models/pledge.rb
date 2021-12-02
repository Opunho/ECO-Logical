class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :recommendation

  def self.unique_complete
    Pledge.where(completed: true).group(:recommendation_id).count
  end
end
