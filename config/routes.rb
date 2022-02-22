Rails.application.routes.draw do
  devise_for :accounts
  
  root "public#index"
end
