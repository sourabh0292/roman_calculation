Rails.application.routes.draw do
  root 'calculation#index'
  post 'calculation', to: 'calculation#calculation'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
