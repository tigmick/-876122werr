Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  match "/admin/candidate/:id/jobs" => 'admin/candidate#candidate_jobs', via: :get, as: "admin_candidate_jobs"
  match "/admin/candidate/:candidate_id/job/:id/schedule" => 'admin/candidate#candidate_job_schedules', via: :get, as: "admin_candidate_job_schedules"
 
  # match "/admin/update_passwords" => 'admin/update_passwords#update', via: :post

  get 'users/dashboard'

  get 'jobs/index'
  resources :resumes do 
    member do
      get :download
    end
  end
  resources :jobs do
    resources :interviews, only: [:new,:create]
  end
  resources :interview_schedules, only: [:create, :show, :destroy] do
    collection do
      post "candidate_feedback"
      post "client_comment"
      post "next_step"
      post "meeting"
    end
  end
  delete '/destroy_comment/:id', :to => "interview_schedules#destroy_comment", :as => :destroy_comment
  delete '/destroy_feedback/:id', :to => "interview_schedules#destroy_feedback", :as => :destroy_feedback
  
  devise_for :users
   resources :users , only: [] do
      member do
        get "user_profile"
     end
     resources :user_jobs, only: :create
   end 
  get 'welcome/index'
  post 'welcome/search'
  match 'welcome/search', :to => "welcome#search", :as => :search, :via => [:get,:post]
  match 'welcome/search_candidate', :to => "welcome#search_candidate", :as => :search_candidate, :via => [:get,:post]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
