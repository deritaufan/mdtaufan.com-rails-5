Rails.application.routes.draw do
  get 'sessions/new'

  root 'home_page#home'
  post '/contact', to: 'home_page#contact'
  
  scope "/admin" do
  	get '/dashboard', to: 'editors#dashboard'
  	get '/register', to: 'editors#new'
  	post '/register', to: 'editors#create'
  	get '/login', to: 'sessions#new'
  	post '/login', to: 'sessions#create'
  	delete '/logout', to: 'sessions#destroy'
  	resources :editors
  end
  
end
