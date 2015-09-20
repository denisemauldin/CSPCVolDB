class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # default abilities
    can :read, Position
    can :read, Event
    can :read, Calendar
    
    # this is the admin's way to add roles
    # user can edit their own information via the devise controller
    if user.has_any_role?({:name => :vcd, :name => :dir})
      Rails.logger.error("user #{user.inspect} has roles vcd or dir #{user.roles.inspect}")
      can :manage, :all
      can :manage, Event
      can :manage, Calendar
    end


#    if user.has_role?(:dir)
#      Rails.logger.debug("user #{user.inspect} has role #{user.roles.inspect}")
#    end
                
  end

end