Rails.application.routes.draw do

  get 'users/:id/edit' => "users#edit"
  post 'users/:id/update' => "users#update"
  post 'users/create' => "users#create"
  get 'signup' => "users#new"
  
  post 'logout' => "users#logout"
  get 'login' => "users#login_form"
  post 'login' => "users#login"
  get 'users/index' => "users#index"
  get 'users/:id' => "users#show"

  get 'items/index' => "items#index"
  get 'items/new' => "items#new"
  post 'items/create' => "items#create"
  get 'items/:id' => "items#show"
  get 'items/:id/edit' => "items#edit"
  post 'items/:id/update' => "items#update"
  delete 'items/:id/destroy' => "items#destroy"
  get '/' => "home#top"
  
  get 'about' => "home#about"
  
end
