class Starship < ActiveRecord::Base
  validates(:name, presence: true)
  validates(:ship_class, presence: true)
  validates(:location, presence: true)

  has_many :crew_members

  # def crew_members
  #   CrewMember.where(ship_id: self.id)
  # end


end
