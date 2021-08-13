Rails.application.routes.draw do
  post '/admin/vehicle_models' => 'admin/vehicle_models#create'
  post '/admin/vehicles' => 'admin/vehicles#create'

  get '/search' => 'search#index'
end
