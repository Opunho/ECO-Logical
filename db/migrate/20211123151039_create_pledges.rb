class CreatePledges < ActiveRecord::Migration[6.1]
  def change
    create_table :pledges do |t|
      t.boolean :completed
      t.references :user, null: false, foreign_key: true
      t.references :recommendation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
