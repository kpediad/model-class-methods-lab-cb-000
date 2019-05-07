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
    self.joins(boats: {boat_classifications: :classification}).where("classifications.name IN ('Sailboat', ' Motorboat')").distinct
  end
  

  def self.non_sailors
    self.joins(boats: {boat_classifications: :classification}).where.not("classifications.name = 'Sailboat'").distinct
  end

end
