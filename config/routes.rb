Rails.application.routes.draw do
    devise_for :users, controllers: { omniauth_callbacks: 'callback' }
    root 'register#index'

    namespace 'api' do
        resources :schedule, :book
    end
end
