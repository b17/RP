Untitled8::Application.routes.draw do

  #resources :announces


  resources :users


  resources :tags
  get "announces/create"

  get "admin/p_add"

  get "admin/p_my_announces"

  get "admin/p_text_stats"

  get "admin/p_map_stats"

  get "admin/p_calendar"

  get "admin/c_add"

  get "admin/c_delete"

  get "admin/c_disable"

  get "admin/p_edit"

  get "secure/login"

  get "secure/logout"

  get "secure/login"

  controller :root do
    get 'tag' => :all_tags
    get 'tag/:id' => :tag
    get 'random' => :rand
  end

  controller :admin do
    get "admin" => :welcome

    get "calendar" => :p_calendar
    get "announce" => :p_my_announces
    get "stats" => :p_text_stats
    get "maps" => :p_map_stats
    get "calendar" => :p_calendar
    get "add" => :p_add
    get "info/:id" => :info
    get "trash/:id" => :c_disable

    post "delete" => :c_delete
    post "c_add" => :c_add


  end


  controller :secure do
    post "login" => :login
    get "logout" => :logout
    get "fail" => :fail
  end


  controller :announces do
    get "addsomenew" => :create
  end


  controller :image do
    get "announces/:id/front_img" => :announce_images
    get "show/:id" => :show

  end

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
  # just remember to delete public/___.html.
  #root :to => 'welcome#index'
  root :to => 'root#feed'


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
