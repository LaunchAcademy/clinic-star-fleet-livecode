class CreateStarShips < ActiveRecord::Migration[6.1]
  def change
    create_table :star_ships do |t| 
      t.string :name, null: false 
      t.string :location, null: false 
      t.string :ship_class, null: false 

      t.timestamps null: false
    end
  end
end
