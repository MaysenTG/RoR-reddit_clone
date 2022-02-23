Rails.application.routes.draw do
  resources :communities do
    resources :posts
  end
  
  resources :posts do
    resources :comments
  end
  
  devise_for :accounts
  
  root "public#index"
end
