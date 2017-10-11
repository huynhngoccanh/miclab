Rails.application.routes.draw do
  devise_for :users
  resources :categorys do
  	resources :blogs do
  	end
  end
  resources :blogs
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
