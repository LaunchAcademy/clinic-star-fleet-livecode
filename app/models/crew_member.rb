class CrewMember < ActiveRecord::Base 

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :star_ship_id, presence: true

    belongs_to :star_ship

end