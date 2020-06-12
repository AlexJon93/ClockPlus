Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#main'
  get '/toggle_hour', to: 'static_pages#toggle_hour'
end
