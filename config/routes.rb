Rails.application.routes.draw do
    namespace :api do
        namespace :v1 do
            resources :users, only: [:create, :show] do
                resources :cars
            end
            post 'login', to: 'authentication#login'         
        end
    end
end
