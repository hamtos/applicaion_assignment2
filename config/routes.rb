Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to =>"homes#top"
  get "home/about" => "homes#about"
  get "search" => "searches#search", as: "search"
  devise_for :users

  resources :users, only: [:index,:show,:edit,:update] do
    get "followers"=>"relationships#following_index", as: "following"
    get "followed"=>"relationships#followers_index", as: "followers"
    resource :relationships, only: [:create, :destroy]
  end

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end