Rails.application.routes.draw do
  root to: 'states#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :states, only: [ :index, :show ] do
    resources :counties, only: [ :index, :show ]
  end
end
