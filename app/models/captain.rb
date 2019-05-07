class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    binding.pry
    self.joins(:boats).joins(boat_classifications: :classification).where("classifications.name = 'Catamaran'")
  end

  def self.sailors
    self.joins(:boats).joins(boat_classifications: :classification).where("classifications.name = 'Sailboat'")
  end

  def self.talented_seafarers
    self.self.joins(:boats).joins(boat_classifications: :classification).where("classifications.name IN ('Sailboat', ' Motorboat')")
  end

  def self.non_sailors
    self.joins(:boats).joins(boat_classifications: :classification).where.not("classifications.name = 'Sailboat'")
  end

end
