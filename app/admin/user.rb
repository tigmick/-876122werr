ActiveAdmin.register User do
  index :title => 'LIST OF USERS' 
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :email, :first_name,:last_name, :password, :password_confirmation,:role
   breadcrumb do
     []   
   end 
  index do
    selectable_column
    column :email
    column :first_name
    column :last_name
    column :role
    actions
  end

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :first_name
      f.input :last_name
      f.input :contact_no
      f.input :password_confirmation
      f.label :role, class: "select-role"
      f.select(:role, options_for_select(['client', 'candidate']),style:"margin-left:225px;")
      
    end
    f.button "Create User"
  end


end
