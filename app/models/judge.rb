class Judge < ActiveRecord::Base

  has_many :scores, dependent: :restrict_with_error
  
  validates :name, presence: true
  
  
  def to_s
    self.name
  end

end
