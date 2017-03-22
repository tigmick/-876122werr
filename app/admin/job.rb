ActiveAdmin.register Job do

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

  permit_params :title, :description,:industry_id
  index do
    selectable_column
    column :title
    #column :description
    column "description" do |job|
          truncate(job.description, omision: "...", length: 100)
        end
    column :industry_id
    actions
  end

  form do |f|
    f.inputs "User Details" do
      f.input :title
      f.input :description
      f.label :industry_id, class: "select-role"
      f.select("industry_id", Industry.all.collect {|p| [ p.title, p.id ] }, {include_blank: 'None'})
      
    end
    f.button "Create Job"
  end


end
