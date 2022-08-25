Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get '/', to: 'welcome#index'
get '/vacation_homes', to: 'vacation_homes#index'
get '/vacation_homes/:id', to: 'vacation_homes#show'
get '/bookings', to: 'bookings#index'
get '/bookings/:id', to: 'bookings#show'

get '/vacation_homes/:id/bookings', to: 'vacation_homes_bookings#index'
end
