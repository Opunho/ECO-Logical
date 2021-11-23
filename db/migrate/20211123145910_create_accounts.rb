class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :account_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
