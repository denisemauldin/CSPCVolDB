class Schedule < ActiveRecord::Base
  belongs_to :staff
  belongs_to :location
  has_one :event, through: :staff
  has_one :shift, through: :staff
  has_one :position, through: :staff
  has_one :user, through: :offer
  has_one :permanent, through: :staff, :foreign_key => :permanent_user   
end
