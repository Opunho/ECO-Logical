class AddFontToRecommendations < ActiveRecord::Migration[6.1]
  def change
    add_column :recommendations, :font, :string
  end
end
