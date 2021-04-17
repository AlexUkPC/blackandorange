Rails.application.routes.draw do
  resources :bandos
  devise_for :users, controllers:{registrations:'registrations'}	
  to root 'bandos#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
