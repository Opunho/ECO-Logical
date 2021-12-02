class AddIconToRecommendation < ActiveRecord::Migration[6.1]
  def change
    add_column :recommendations, :icon, :string
  end
end
