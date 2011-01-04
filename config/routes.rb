Murder::Application.routes.draw do
  scope "/murder" do
    resources :kills
  end
  root to: 'index#index'
end
