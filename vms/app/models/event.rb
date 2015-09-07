class Event < ActiveRecord::Base
  include IceCube
  
  belongs_to :calendar
  
  validates :name, :presence => true
  validates :schedule_yaml, :presence => true

  def recurring_schedule=(ruleHash)
    if ruleHash.match("{}") then
        self.schedule_yaml = IceCube::Schedule.new(self.start).to_yaml
    end  
    if RecurringSelect.is_valid_rule?(ruleHash) then
      ics = IceCube::Schedule.new
      ics.add_recurrence_rule(RecurringSelect.dirty_hash_to_rule(ruleHash))
      Rails.logger.debug("recurring_schedule= ics #{ics.inspect}")
      self.schedule_yaml = ics.to_yaml
    end  
  end
  
  def recurring_rule
    if self.schedule_yaml.nil? then
      Rails.logger.debug("recurring_rule setting schedule to nil")
      return IceCube::Schedule.new(self.start)
    else
      Rails.logger.debug("recurring_rule schedule_yaml #{schedule_yaml.inspect}")
      value = IceCube::Schedule.from_yaml(self.schedule_yaml)
      Rails.logger.debug("value #{value.inspect}")
      return value
    end
  end  
  
  def recurring_schedule
    Rails.logger.debug("recurring_schedule #{self.inspect}")
    if self.schedule_yaml.nil? then
      Rails.logger.debug("setting schedule to nil")
      return IceCube::Schedule.new(self.start)
    else
      Rails.logger.debug("recurring_schedule schedule_yaml #{schedule_yaml.inspect}")
      value = IceCube::Schedule.from_yaml(self.schedule_yaml)
      Rails.logger.debug("recurring_schedule value #{value.inspect}")
      rule = value.recurrence_rules.first
      Rails.logger.debug("recurring_schedule rule #{rule.inspect}")      
      return rule.to_hash 
    end
  end
        
  def non_recurring_rule; 1; end
end



