class Category < ActiveRecord::Base

  has_many :contestants, dependent: :restrict_with_error
  
  validates :name, presence: true
  validates :code, presence: true, uniqueness: true
  
  
  def to_s
    self.name
  end
  
  def ranking
    self.contestants.joins( :scores ).group( :contestant_id ).order( score: :desc ).limit( 10 )
  end

end
