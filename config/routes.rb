Rails.application.routes.draw do
  get '/', to:'welcome#index'
  get '/profile', to: 'users#show'

  get 'auth/google_oauth2', as: 'google_oauth2_login'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  get '/search', to: 'solar_system#show'

  get '/space_people', to: 'space_people#index'
  get '/sun_and_moon_search', to: 'solar_search#search'
  get '/sun_and_moon', to: 'solar_search#show'
end
