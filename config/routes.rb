Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
    namespace :api do
        namespace :v1 do
            resources :users, only: [:index, :create, :show, :destroy] do
                resources :cars, only: [:index, :create, :show, :destroy]
                resources :reservations, only: [:index, :create, :show, :destroy]
            end
            post 'login', to: 'authentication#login'         
        end
    end
end
