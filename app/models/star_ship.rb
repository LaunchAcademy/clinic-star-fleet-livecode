class StarShip < ActiveRecord::Base 
    validates :name, presence: true
    validates :location, presence: true
    validates :ship_class, presence: true

    has_many :crew_members

end
#  name, ship class, and location of the starship.