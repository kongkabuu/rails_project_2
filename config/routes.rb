Rails.application.routes.draw do
# GET /heroes
get '/heroes', to: 'heroes#index'

# GET /heroes/:id
get '/heroes/:id', to: 'heroes#show'

# GET /powers
get '/powers', to: 'powers#index'

# GET /powers/:id
get '/powers/:id', to: 'powers#show'

# PATCH /powers/:id
patch '/powers/:id', to: 'powers#update'

# POST /hero_powers
post '/hero_powers', to: 'hero_powers#create'

end
