Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :devices do
    resources :readings
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'dashboard#index'

  # API

  namespace :api, defaults: { format: 'json' } do
    scope module: :v1 do
      # /api/fixed_incomes
      post '/readings/insert/:write_key' => 'readings#insert'
    end
  end
end
