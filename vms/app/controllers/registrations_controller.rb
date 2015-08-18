class RegistrationsController < Devise::RegistrationsController

  def edit
      @roles = Role.all
      Rails.logger.debug("Session controller found roles #{@roles.inspect}")
      super
  end
  
  def update
    Rails.logger.debug("called update in registrations with #{params.inspect}")
    if params[:user][:role_ids] then
      Rails.logger.debug("processing roles")
      
    end
    @roles = Role.all   
    super
  end
  
end