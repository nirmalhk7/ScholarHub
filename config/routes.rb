Rails.application.routes.draw do
  root to: 'page#dashboard'

  namespace :page do
    get 'dashboard'
    get 'about_us'
  end

  resources :grants
  resources :events
  resources :papers
  resources :collaborations
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
