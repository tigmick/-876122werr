ActiveAdmin.register_page "Candidate" do
  content title: "Candidate", only: :candidate do
    render 'admin/candidates/candidate'
  end
end