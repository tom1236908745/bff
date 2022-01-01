Rails.application.routes.draw do
  get 'items/index' => "items#index"
  get '/' => "home#top"
  get 'about' => "home#about"
end
