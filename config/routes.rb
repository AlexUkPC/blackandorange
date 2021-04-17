Rails.application.routes.draw do
  resources :bandos do
    resource :comments
    member do
      put 'like', to: "bandos#like"
      put 'unlike', to: "bandos#unlike"
    end
  end
  devise_for :users, controllers:{registrations:'registrations'}	
  root 'bandos#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
