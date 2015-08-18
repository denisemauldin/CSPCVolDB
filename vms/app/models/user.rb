class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [ :login ]
  validates :username,
    :presence => true,
    :uniqueness => { :case_sensitive => false }
    
  has_and_belongs_to_many :positions
  
   def after_sign_in_path_for(user)
    user.admin? ? admin_dashboard_path : root_path 
  end



  # make it so that a user can login with their username, email, or member_number    
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value OR lower(member_number) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end
  
  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email || self.member_number
  end
  # end login conditions code
end
