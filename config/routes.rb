Rails.application.routes.draw do
  get 'totalpost/show/:totalpost_id' => 'totalpost#show'
  get '/intro' => 'home#intro'
  get '/recommend' => 'home#recommend'
  get '/edit_tags' => 'home#edit_tags'
  get '/like/:id' => 'home#like'
  get '/dislike/:id' => 'home#dislike'
  get '/scrap/:id' => 'home#scrap'
  get 'scrap_index' => 'home#scrap_index'

  devise_for :users, :controllers => { registrations: 'registrations' }
  post "data" => "home#data_input"
  get "search" => "home#search"
  resources :history
  root to: "home#index"
end
