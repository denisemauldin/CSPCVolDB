ActiveAdmin.register User do
  # if you add a parameter here, then also add it to application_controller
  # in the configure_permitted_parameters section
  permit_params :username, :email, :member_number, :password, 
                :password_confirmation, :active, roles: []
  index do
    selectable_column
    id_column
    column :username
    column :email
    column :member_number
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :username
  filter :email
  filter :member_number
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :username
      f.input :email
      f.input :member_number
      f.inputs do 
        f.has_many :roles, heading: "Roles", allow_destroy: true, new_record: false do |a|
          f.input :role_ids, :as => :check_boxes
        end
      end
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
