class CreateCalculations < ActiveRecord::Migration[6.1]
  def change
    create_table :calculations do |t|
      t.float :total_expenses
      t.float :total_emmissions
      t.references :emmission, null: false, foreign_key: true
      t.references :expense, null: false, foreign_key: true

      t.timestamps
    end
  end
end
