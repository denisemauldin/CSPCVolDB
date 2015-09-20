class Location < ActiveRecord::Base
  has_many :events, through: :schedules
  has_many :default_events, through: :events, :foreign_key => :default_location
end
