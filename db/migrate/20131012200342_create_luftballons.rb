class CreateLuftballons < ActiveRecord::Migration
  def change
    create_table :luftballons do |t|
    	t.string :inscription, :null => false
    	t.string :color, :null => false
    	t.string :gas, :null => false
    	t.integer :psi, :null => false
    	t.string :origin, :null => false
    	t.date :manufacture_date, :null => false

      t.timestamps
    end
  end
end
