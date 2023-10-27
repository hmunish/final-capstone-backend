Rails.application.routes.draw do
    namespace :api do
        namespace :v1 do
            resources :users
            post '/authenticate', to: 'users#authenticate'
        end
    end
end
