Murder::Application.routes.draw do
  scope "/murder" do
    resources :kills
    root to: 'index#index'
  end
end
