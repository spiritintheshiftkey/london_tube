class CreateJourneys < ActiveRecord::Migration[7.0]
  def change
    create_table :journeys do |t|
      t.belongs_to :oyster_card
      t.integer :entry_station_id, optional: true
      t.integer :exit_station_id, optional: true
      t.integer :amount_pence
      t.timestamps
    end
  end
end
