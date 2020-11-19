Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root 'users#index' #temp will be making root a static home page

resources :users
resources :doctors do
  resources :appointments, only: [:index, :new, :create, :destroy]
end
end
