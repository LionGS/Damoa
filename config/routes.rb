Rails.application.routes.draw do
  get 'totalpost/show:totalpost_id'

  get 'totalpost/data_input'

  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  post "data" => "home#data_input"
  get "search" => "home#search"
end
