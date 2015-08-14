class Position < ActiveRecord::Base

  validates :name, presence: true
  validates :desc, presence: true, length: { in: 10..500, too_long: "%{count} is the maximum number of characters and spaces" }
  has_and_belongs_to_many :users    
  enum training: [ :yes, :no ]
                      
end
