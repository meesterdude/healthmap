Rails.application.routes.draw do
  root 'addresses#index'
  resources :addresses

end
