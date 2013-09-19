RestPlaces::Application.routes.draw do


  get "user_service/p_register"

  get "user_service/p_reset"

  get "user_service/p_login"

  get "user_service/c_register"

  get "user_service/c_reset"

  resources :tests


  resources :news
  resources :users

  get "home" => 'root#feed'

  controller :root do
    get 'tags' => :all_tags
    get 'tag/:rewrite.:format' => :tag, :as => 'tag_view', :defaults => {:format => 'html'}
    get 'article/:rewrite-:id.:format' => :article, :as => 'news_view', :defaults => {:format => 'html'}
    get 'random' => :rand
    get 'test' => :dev_test
    get 'announce/:rewrite-:id.:format' => :announce, :as => 'announce_view', :defaults => {:format => 'html'}
    get 'category/:rewrite' =>:category,:as =>:category_filter

  end
  controller :admin_announce do
    get '/admin/announce/search/panel' => :search
    post '/admin/announce/search/results' => :view
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
    post "c_edit" => :c_update_announce


  end


  controller :user_service do
    post "login" => :login
    get "logout" => :logout
    get "fail/permissions" => :fail
    get "fail/auth" => :fail
    get 'session/debug' => :debug_session
    get 'registration' => :p_register
    post 'register' => :c_register
    post 'user/validate' => :validate, :as => 'user_validate'

  end


  controller :fail do

    #page
    get "miss" => :not_found
    get "not_found" => :not_found
    get "404" => :not_found
    #credentials
    get 'fail/login' =>:login
    get 'fail/permission' =>:permission

  end

  controller :superuser do
    get 'manage' => :view
  end


  controller :tag do
    get 'manage/tags/' => :p_all

    get 'manage/tag/new' => :p_add
    post 'manage/tag/save_new' => :c_save

    get 'manage/tag/:id/edit' => :p_edit
    post 'manage/tag/:id/update' => :c_tag_update

    get 'manage/tag/:id/activate' => :c_activate
    get 'manage/tag/:id/disable' => :c_disable
    get 'manage/tag/:id/delete' => :c_delete

  end

  controller :news do
    get 'manage/news/' => :p_all

    get 'manage/news/new' => :p_add
    post 'manage/news/save_new' => :c_save

    get 'manage/news/:id/edit' => :p_edit
    post 'manage/news/:id/update' => :c_news_update

    get 'manage/news/:id/disable' => :c_disable
    get 'manage/news/:id/activate' => :c_activate
    get 'manage/news/:id/delete' => :c_delete
    get 'manage/news/:id/info' => :p_info


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
