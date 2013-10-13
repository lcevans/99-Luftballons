class CreateLuftballonRentalRequests < ActiveRecord::Migration
  def change
    create_table :luftballon_rental_requests do |t|
    	t.integer :luftballon_id, :null => false
    	t.date :start_date, :null => false
    	t.date :end_date, :null => false
    	t.string :status, :null => false

      t.timestamps
    end

    add_index :luftballon_rental_requests, :luftballon_id
  end
end
