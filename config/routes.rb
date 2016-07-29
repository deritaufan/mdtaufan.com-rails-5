Rails.application.routes.draw do
  root 'home_page#home'
  post '/contact', to: 'home_page#contact'
end
