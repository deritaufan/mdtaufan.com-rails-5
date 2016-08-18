Rails.application.routes.draw do
  get 'editors/new'

  root 'home_page#home'
  post '/contact', to: 'home_page#contact'
end
