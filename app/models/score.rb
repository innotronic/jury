class Score < ActiveRecord::Base

  belongs_to :contestant
  belongs_to :judge
  
  validates :judge, presence: true
  validates :contestant, presence: true
  validates :value, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  
  after_save :update_contestant_score
  
  
  private
  
  def update_contestant_score
    self.contestant.update_score if self.contestant
  end

end
