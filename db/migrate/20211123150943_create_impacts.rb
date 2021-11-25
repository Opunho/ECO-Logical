class CreateImpacts < ActiveRecord::Migration[6.1]
  def change
    create_table :impacts do |t|
      t.references :emmission, null: false, foreign_key: true
      t.references :recommendation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
