class Location < ActiveRecord::Base
  has_many :schedules
  has_many :events, through: :schedules
  has_many :default_events, class_name: "Event", :foreign_key => :default_location
end
