Untitled8::Application.routes.draw do

  get "news_manager/view_news"

  get "news_manager/add_news"

  get "news_manager/edit_news"

  resources :news


  get "fail/not_found"
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

  get "home" => 'root#feed'

  controller :root do
    get 'tag' => :all_tags
    get 'tag/:id' => :tag
    get 'random' => :rand
    get 'announce/:id' => :announce
  end

  controller :admin do
    get "admin" => :p_my_announces

    get "calendar" => :p_calendar
    get "announce" => :p_my_announces
    get "stats" => :p_text_stats
    get "maps" => :p_map_stats
    get "calendar" => :p_calendar
    get "add" => :p_add
    get "info/:id" => :info
    get "trash/:id" => :c_disable
    get "activate/:id" => :c_activate
    get "edit/:id" => :p_edit
    get "delete/:id" => :c_delete

    post "c_add" => :c_add
    post "c_edit" => :c_edit


  end


  controller :secure do
    post "login" => :login
    get "logout" => :logout
    get "fail" => :fail
  end


  controller :announces do
    get "addsomenew" => :create
  end

  controller :fail do
    get "miss" => :not_found
    get "not_found" => :not_found
    get "404" => :not_found
  end
  controller :image do
    get "announces/:id/front_img" => :announce_images
    get 'show/:id' => :show

  end


  controller :superuser do
    post 'manage/add' => :c_add_tag
    post 'manage/tag/update' => :c_update_tag

    get 'manage' => :view
    get 'manage/tags/' => :p_view_tags
    get 'manage/tags/:id/edit' => :p_edit_tag

    get 'manage/news/new' => :p_news_create
    get 'manage/news/all' => :p_news_view
    get 'manage/news/:id/edit/' => :p_news_edit

    post 'manage/news/create' => :c_news_add
    post 'manage/news/:id/update' => :c_news_update


  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actiqons automatically):
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
