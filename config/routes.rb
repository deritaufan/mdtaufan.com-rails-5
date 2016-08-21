Rails.application.routes.draw do
  root 'home_page#home'
  post '/contact', to: 'home_page#contact'
  get '/register', to: 'editors#new'
  post '/register', to: 'editors#create'
  resources :editors
end
