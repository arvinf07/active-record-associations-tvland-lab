class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    "#{self.first_name} #{self.last_name}"
  end  

  def list_roles
    characters = self.characters
    shows = self.shows
    characters.map.with_index {|character, i| "#{character.name} - #{shows[i].name}"}
  end  
end