Rails.application.routes.draw do
  root to: 'pages#home'
  get 'pages/faq'

  devise_for :users
  resources :users, shallow:true do
    resources :gpxes do
      resources :elevationgraphs
      resources :topographicmaps
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
