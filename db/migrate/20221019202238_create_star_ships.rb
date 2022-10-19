class CreateStarShips < ActiveRecord::Migration[6.1]
  def change
    create_table :star_ships do |t| 
      t.string :name, null: false
      t.string :location, null: false 
      t.string :ship_class

      t.timestamps
    end
  end
end
