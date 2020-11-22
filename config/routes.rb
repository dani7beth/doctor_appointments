Rails.application.routes.draw do
  # get 'static_pages/home'
  # get 'staticpages/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# get 'static_pages/home'
root 'static_pages#home' #temp will be making root a static home page
# get '/home', to: 'static_pages#home'

resources :users
resources :doctors do
  resources :appointments, only: [:index, :new, :create, :destroy]
end
end
