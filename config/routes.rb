Rails.application.routes.draw do

  root 'main#index'
  get 'main/ranking'
  
  get 'jury', to: 'jury#main'
  post 'jury/score'
  post 'jury/judge'
  
  resources :contestants
  resources :scores
  resources :judges
  resources :categories

end
