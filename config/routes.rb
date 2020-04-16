Rails.application.routes.draw do
  get '/', to:'welcome#index'
  get '/profile', to: 'users#show'
  get '/profile/edit', to: 'users#edit'
  patch '/profile', to: "users#update"

  get 'auth/google_oauth2', as: 'google_oauth2_login'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/search', to: 'solar_system#show'

  get '/space_people', to: 'space_people#index'
  get '/sun_and_moon_search', to: 'solar_search#search'
  get '/sun_and_moon', to: 'solar_search#show'

  get '/favorites', to: 'favorites#index'
  get '/favorites/new', to: 'favorites#new'
  post '/favorites', to: 'favorites#create'
  get '/favorites/:favorite_id', to: 'favorites#show'
  delete '/favorites/:favorite_id', to: 'favorites#destroy'

end
