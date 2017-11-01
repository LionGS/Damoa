Rails.application.routes.draw do
  get 'totalpost/show/:totalpost_id' => 'totalpost#show'
  get '/intro' => 'home#intro'
  get '/recommend' => 'home#recommend'

  devise_for :users, :controllers => { registrations: 'registrations' }
  post "data" => "home#data_input"
  get "search" => "home#search"
  resources :history
  root to: "home#index"
end
