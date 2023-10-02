class CreateZones < ActiveRecord::Migration[7.0]
  def change
    create_table :zones do |t|
      t.integer :zone_number
    end
  end
end
