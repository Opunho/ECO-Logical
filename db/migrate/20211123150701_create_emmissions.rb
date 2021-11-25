class CreateEmmissions < ActiveRecord::Migration[6.1]
  def change
    create_table :emmissions do |t|
      t.string :main_category
      t.string :sub_category
      t.float :co2_grams
      t.integer :mcc
      t.references :expense, null: false, foreign_key: true

      t.timestamps
    end
  end
end
