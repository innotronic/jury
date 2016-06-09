class Contestant < ActiveRecord::Base

  belongs_to :category
  has_many :scores, dependent: :destroy
  
  validates :number, presence: true, uniqueness: true
  
  
  def to_s
    self.name
  end
  
  def update_score
    self.update( score: self.scores.average( :value ) + 0 )
  end
  
  def ranking
    self.category.contestants.where( "score > ?", self.score ).count + 1
  end

end
