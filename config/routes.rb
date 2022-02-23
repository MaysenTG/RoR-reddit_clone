Rails.application.routes.draw do
  resources :communities do
    resources :posts
  end
  
  devise_for :accounts
  
  root "public#index"
end
