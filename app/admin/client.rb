ActiveAdmin.register_page "Client" do
	
  content title: "Client", only: :client do
    render 'admin/clients/client'
  end
end