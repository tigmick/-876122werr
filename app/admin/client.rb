ActiveAdmin.register_page "Client" do
	
  content title: "LIST OF CLIENTS", only: :client do
    render 'admin/clients/client'
  end

  breadcrumb do
 [
   # link_to('Admin', admin_root_path),
 ]   
end 
end