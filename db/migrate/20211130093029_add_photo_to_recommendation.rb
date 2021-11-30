class AddPhotoToRecommendation < ActiveRecord::Migration[6.1]
  def change
    add_column :recommendations, :photo, :string
  end
end
