ConsulAssemblies::Engine.routes.draw do



  resources :proposals
  resources :meetings
  resources :assemblies

  namespace :admin do

    resources :meetings
  end

end
