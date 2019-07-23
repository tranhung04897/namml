Rails.application.routes.draw do
  root 'home#index'
  resources :todos do
    resources :items
  end
end
