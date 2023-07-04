class HerosController < ApplicationController
rescue_from ActiveRecord::RecordNotFound , with: :render_not_found_response
def index
heros = Hero.all
render json: heros.to_json(except:[created_at, updated_at],include:{power:{except:[created_at,updated_at]},hero_powers:{except:[created_at,updated_at]}}), status: :ok
end

def show
hero = find_hero
render json: hero.to_json(except:[created_at, updated_at],include:{power:{except:[created_at,updated_at]},hero_powers:{except:[created_at,updated_at]}}),status: :ok
end


private

def find_hero
Hero.find!(params[:id])
end

def render_not_found_response
render json: {error: "Hero not found"}, status: :not_found
end


end
