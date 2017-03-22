ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }
  
   content title: "Admin Dashboard"
   breadcrumb do
 [
   # link_to('Admin', admin_root_path),
 ]
 end 
end
