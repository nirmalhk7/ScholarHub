Rails.application.routes.draw do
  get 'page/index'

  root to: 'page#index'
  resources :grants
  resources :events
  resources :papers
  resources :collaborations
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
