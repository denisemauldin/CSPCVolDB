class Role < ActiveRecord::Base

  validates :name, presence: true
  validates :lead, presence: true
  validates :desc, presence: true, length: { in: 10..500, too_long: "%{count} is the maximum number of characters and spaces" }
    
  enum training: [ :yes, :no ]
                      
end
