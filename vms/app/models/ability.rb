class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # default abilities
    can :read, Position
    
    # this is the admin's way to add roles
    # user can edit their own information via the devise controller
    if user.has_any_role?({:name => :vcd, :name => :dir})
      can :manage, User
    end


    if user.has_role?(:dir)
      Rails.logger.debug("user #{user.inspect} has role #{user.roles.inspect}")
    end
                
  end

end