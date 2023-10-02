class CreateOysterCards < ActiveRecord::Migration[7.0]
  def change
    create_table :oyster_cards do |t|
      t.integer :balance_pence, default: 0
      t.timestamps
    end
  end
end
