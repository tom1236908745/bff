Rails.application.routes.draw do
  
  get 'items/index' => "items#index"
  get 'items/:id' => "items#show"
  get '/' => "home#top"
  get 'about' => "home#about"
  
end
