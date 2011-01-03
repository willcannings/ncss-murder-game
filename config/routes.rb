Murder::Application.routes.draw do
  resources :kills
  root to: 'index#index'
end
