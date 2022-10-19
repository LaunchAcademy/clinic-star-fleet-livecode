class CrewMember < ActiveRecord::Base 
    belongs_to :star_ship
    validates :star_ship_id, presence: true

    validates :first_name, presence: true
    validates :last_name, presence: true

end