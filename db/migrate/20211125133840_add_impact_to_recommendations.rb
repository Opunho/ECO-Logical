class AddImpactToRecommendations < ActiveRecord::Migration[6.1]
  def change
    add_column :recommendations, :co2_grams, :integer
  end
end
