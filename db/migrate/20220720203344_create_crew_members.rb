class CreateCrewMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :crew_members do |t| 
      t.string :first_name, null: false 
      t.string :last_name, null: false 
      t.string :specialty_division
      t.belongs_to :star_ship, null: false 
      # t.intenger :ship_id, null: false 

      t.timestamps null: false
    end
  end
end
