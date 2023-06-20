Rails.application.routes.draw do

  devise_for :users
  root to: "items#index"

  resources :items, only: [:index, :new, :create] do
    collection do
      post 'new', to: 'items#create'
    end
  end

end