class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.string :category
      t.string :creditor_name
      t.float :amount
      t.string :currency
      t.date :date
      t.string :external_id
      t.string :creditor_id
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
