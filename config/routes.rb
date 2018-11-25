Rails.application.routes.draw do
  devise_for :users
  get '/top' => 'homes#top'
  get '/about' => 'homes#about', as: "about"
  get "users/:id" => "users#show", as: :mypage
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users
  resources :homes
  root to: 'homes#top'
end
