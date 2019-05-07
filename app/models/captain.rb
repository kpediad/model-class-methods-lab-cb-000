class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    self.joins(:boats).joins(boat_classifications: :classifications).where("classifications.name = 'catamaran'")
  end

  def self.sailors
    self.joins(:boats).joins(boat_classifications: :classifications).where("classifications.name = 'sailboat'")
  end

  def self.talented_seafarers
    self.self.joins(:boats).joins(boat_classifications: :classifications).where("classifications.name IN ('sailboat', ' motorboat')")
  end

  def self.non_sailors
    self.joins(:boats).joins(boat_classifications: :classifications).where.not("classifications.name = 'sailboat'")
  end

end
