Rails.application.routes.draw do
  resources :communities do
    resources :posts
  end
  
  get 'communities/:id/edit' => 'communities#update'
  
  resources :posts do
    resources :comments
  end
  
  resources :account

  
  devise_for :accounts
  
  root "public#index"
end
