ActiveAdmin.register UserJob do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :user_id, :job_ids
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
 


form do |f|
    f.inputs "Job apply details" do
      f.select(:user_id, options_for_select(User.where(role: 'candidate').collect {|u| [u.first_name, u.id]}))
      f.select(:job_ids, options_for_select(Job.all.collect {|j| [j.title, j.id]}),{include_blank: false} ,{multiple: true})
    end
    f.button "Job Apply"
  end
  
end
