JobMatchBasic::Application.routes.draw do

  
  get "about/show",:as=>'about'

  resources :contact_messages,{:except=>[:index]}


  resources :job_post_search
  #public route for guest users
  resources :job_posts,{:only=>[:show]}
  resources :companies,{:only=>[:show]}
   
  resources :applicant_job_preferences,{:only=>[:destroy]}
  resources :applicant_education_histories,{:only=>[:destroy]}
  devise_for :users
  # resources :registrations
  # resources :sessions
  resources :users do
    resources :contact_messages,{:only=>[:index]}
    resources :categories
    resources :locations
    resources :job_posts,{:only=>[:index]}
    resources :applicants do
      resources :applicant_job_preferences
      resources :applicant_job_histories
      resources :applicant_education_histories
      resources :apply_jobs
      resources :resumes
      resources :applicant_job_search do
        collection do
          get 'recommendedjobposts'
        end
      end  
    end
    resources :companies do
      resources :job_posts
      resources :applied_applicants
    end
    resources :admin do
    end
  end

  # resources :companies do
    # resources :job_posts
  # end
  
  resources :applicant_job_search,{:only=>["index"]}
  #resources :job_posts ,{:only=>["index","destroy","show"]}
  #resources :companies ,{:only=>["index","show"]}
  root :to=>'welcome#index'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
