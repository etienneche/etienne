class CreateCuts < ActiveRecord::Migration[5.2]
  def change
    create_table :cuts do |t|
      t.integer :name

      t.timestamps
    end
  end
end
