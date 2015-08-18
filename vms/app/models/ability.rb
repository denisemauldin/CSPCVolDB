class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # default abilities
    can :read, User
    can :manage, User, :id => user.id
    if user.has_any_role?({:name => :vcd, :name => :dir})
      can :read, Position
    end

    can :read, ActiveAdmin::Page, :name => "Dashboard"        
    if user.has_role?(:dir)
      can :read, ActiveAdmin::Page, :name => "Dashboard"
      Rails.logger.debug("user #{user.inspect} has role #{user.roles.inspect}")
    end
                
  end

end