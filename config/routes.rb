Rails.application.routes.draw do
    namespace :api do
        namespace :v1 do
            resources :users do
                resources :cars
            end
            
            # POST '/authenticate', to: 'authenticate'
        end
    end
end
