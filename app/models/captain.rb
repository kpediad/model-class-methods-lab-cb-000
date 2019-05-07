class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    self.joins(boats: {boat_classifications: :classification}).where("classifications.name = 'Catamaran'").distinct
  end

  def self.sailors
    self.joins(boats: {boat_classifications: :classification}).where("classifications.name = 'Sailboat'").distinct
  end

  def self.talented_seafarers
    binding.pry
    motorboat_captains = self.joins(boats: {boat_classifications: :classification}).where("classifications.name = 'Motorboat'").distinct
    self.sailors.joins(motorboat_captains).distinct
  end
  .where("classifications.name = 'Motorboat'")


  def self.non_sailors
    self.joins(boats: {boat_classifications: :classification}).where.not("classifications.name = 'Sailboat'").distinct
  end

end
