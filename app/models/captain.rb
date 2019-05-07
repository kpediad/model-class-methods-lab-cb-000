class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    self.joins(:boats).joins(boat_classifications: :classifications).where("classifications.name = 'catamaran'")
  end
  
end
