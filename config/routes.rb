Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/devices', to: 'devices#index'
  get '/devices/:id', to: 'devices#update'
  get '/device/1', to: 'devices#frontdoor'
  get '/frontdoor', to: 'devices#frontMotion'
  get '/device/2', to: 'devices#room'
  get '/room', to: 'devices#roomMotion'

end
