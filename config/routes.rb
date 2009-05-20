ActionController::Routing::Routes.draw do |map|

  map.namespace :admin do |admin|
    admin.logout '/logout', :controller => 'sessions', :action => 'destroy'
    admin.login '/login', :controller => 'sessions', :action => 'new'
    admin.resources :pages, :collection => { :reorder=>:get, :order=>:post }
    admin.resources :image_galleries, :collection => { :reorder=>:get, :order=>:post } do |image_gallery|
      image_gallery.resources :images, :collection => { :reorder=>:get, :order=>:post }
    end
    admin.resources :posts
    admin.resources :users
    admin.resource :session
    admin.root :controller => 'pages'
  end

  map.pages '/paginas/:action', :controller => 'pages'
  map.resources :pages, :as => :paginas
  map.resources :posts, :as => :mensagens
  map.resources :image_galleries, :as => :fotos
  map.root :controller => 'pages', :action => 'index'
end
