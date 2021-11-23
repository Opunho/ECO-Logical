class CreateRecommendations < ActiveRecord::Migration[6.1]
  def change
    create_table :recommendations do |t|
      t.string :category
      t.string :title
      t.text :description
      t.string :link_to_article

      t.timestamps
    end
  end
end
