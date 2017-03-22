ActiveAdmin.register Resume do

index do
  selectable_column
  column :title
  column :description
  column "CV Name" , :cv_file_name
  column :user_id
  column :created_at
  column :updated_at
  actions
end


show do
    attributes_table do
      row :title
      row :description
      row :cv_file_name
      row :user_id
      row :created_at
  	  row :updated_at
  	  row "download" do
       link_to "Download",admin_resume_download_path(resume)
  	  end
    end
    active_admin_comments
  end
  controller do
		def download
			doc = Resume.find(params[:id])
		  file = File.open(open("#{doc.cv.path}"))
		  data = file.read
		  # doc.track_resume(params[:job_id])  if current_user.client? 
		  send_data(data, :type => "application/#{doc.cv.path.split(".").last}", :filename => "#{doc.cv_file_name}", :x_sendfile=>true)
    return
		end 
	end 
end
