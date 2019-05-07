class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    self.all
  end

  def self.longest
    self.joins(boat_classifications: :boat).order(length: :desc).first
  end
end
