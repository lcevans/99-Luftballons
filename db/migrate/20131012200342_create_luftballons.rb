class CreateLuftballons < ActiveRecord::Migration
  def change
    create_table :luftballons do |t|
    	t.string :inscription, :null => false
    	t.string :color, :null => false
    	t.string :gas, :null => false
    	t.integer :psi, :null => false
    	t.string :origin, :null => false
    	t.date :manufacture_date, :null => false
      t.integer :user_id

      t.timestamps
    end

    add_index :luftballons, :user_id
  end
end
