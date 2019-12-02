class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :total_value
      t.integer :date
      t.integer :status
      t.integer :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
