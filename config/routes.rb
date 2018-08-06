Rails.application.routes.draw do
  resources :users
  resources :microposts
 
  get "pages/home" => "pages#home"
  get "pages/about" => "pages#about"
  get "pages/contact" => "pages#contact"
  get "pages/help" => "pages#help"
  get "users/show" => "users#show"
  
  resources :sessions, only: [:new, :create, :destroy]

  match '/signup',  to: 'users#new', via: :get
  match '/signin',  to: 'sessions#new', via: :post
  match '/signout', to: 'sessions#destroy', via: :delete
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end