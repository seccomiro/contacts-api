Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :phones
  resources :addresses
  resources :contacts do
    post :users, on: :member
  end
  resources :companies
  resources :kinds

  get 'example', to: 'example#index'
  namespace :api do
    namespace :v1 do
      get 'example', to: 'example#index'
      resources :pets
      resources :contacts, only: [] do
        get :phones, on: :member
      end
    end
  end

  root to: 'contacts#index'
end
