class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
    	t.string :name
    	t.string :track
    	t.string :hometown
    	t.text :biography
    	t.integer :band_id
      t.timestamps
    end
  end
end
