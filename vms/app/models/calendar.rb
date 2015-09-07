class Calendar < ActiveRecord::Base
  has_many :events
  validates :name, :description, :color, :presence => true
  validates_format_of :color, with: /\A#?(?:[A-F0-9]{3}){1,2}\z/i,
      message: "%{value} must be a hex RGB color (#xxXXxx).  Ex: #940a3b"
end
