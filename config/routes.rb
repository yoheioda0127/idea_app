Rails.application.routes.draw do

  root to: 'ideas#index'
  resources :ideas, only: [:index, :new, :create, :destroy]
  resources :categorys, only: [:index, :new, :create]  
  
  resources :ideas do
    get :search, on: :collection
  end

end