Rails.application.routes.draw do
  devise_for :users
  root 'all_posts#index'

  resources :users do
    resources :posts
  end

  resources :likes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
