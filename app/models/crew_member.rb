class CrewMember < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :starship_id, presence: true

  belongs_to :starship

  # def starship
  #   Starship.find(self.starship_id)
  # end


end
