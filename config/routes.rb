Rails.application.routes.draw do
  resources :conversations do
    member do
      post 'add_message'
    end
  end

  root to: 'page#dashboard'

  namespace :page do
    get 'dashboard'
    get 'about_us'
  end

  get 'profile/:id', to: 'users#show', as: 'users'

  resources :grants
  resources :events
  resources :papers
  resources :collaborations
  devise_for :users, :controllers => { :registrations => 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
