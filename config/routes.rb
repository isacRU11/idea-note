Rails.application.routes.draw do
  resources :ideas
  devise_for :users
  root 'ideas#index'
end
