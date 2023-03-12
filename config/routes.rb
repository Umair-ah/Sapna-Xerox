Rails.application.routes.draw do
  devise_for :admins, :skip => [:registrations]
  devise_scope :admin do
    get '/admins/sign_out' => 'devise/sessions#destroy'
  end
  
  root 'pages#home'
  get '/about', to: 'pages#about'
 

  resources :orders, only: [:new, :create, :destroy] do
    collection do
      post :delete_all
      
    end

    member do
      get :download_files
    end
    resources :homes, only: [:new, :create, :destroy]
    resources :picks, only: [:new, :create, :destroy]

  end
  resources :admins, only: [:index]
  resources :second_admins, only: [:index]
  resources :third_admins, only: [:index]
  resources :fourth_admins, only: [:index]


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
