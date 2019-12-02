Rails.application.routes.draw do
  root to: 'pages#home'
  get 'pages/faq'

  devise_for :users
  resources :users, shallow:true do
    resources :gpxes do
      resources :elevation_graphs
      resources :topographic_maps
    end
  end

  resources :orders, only: [:new, :create]
end
