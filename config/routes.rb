Rails.application.routes.draw do
  get 'stages/index', as: 'stage'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'status#index'
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
