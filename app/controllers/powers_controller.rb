class PowersController < ApplicationController
  def index
    powers = Power.all
    render json:   render json: powers.to_json(except:[created_at, updated_at],include:{hero:{except:[created_at,updated_at]},hero_powers:{except:[created_at,updated_at]}}), status: :ok
  end

  def show
    power = Power.find_by(id: params[:id])
    if power
      render json: power.to_json(except:[created_at, updated_at],include:{hero:{except:[created_at,updated_at]},hero_powers:{except:[created_at,updated_at]}}), status: :ok
    else
      render json: { error: 'Power not found' }, status: :not_found
    end
  end

  def update
    power = Power.find_by(id: params[:id])
    if power
      if power.update(power_params)
        render json:    render json: power.to_json(except:[created_at, updated_at],include:{hero:{except:[created_at,updated_at]},hero_powers:{except:[created_at,updated_at]}}),:status: :created
      else
        render json: { errors: power.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Power not found' }, status: :not_found
    end
  end

  private

  def power_params
    params.permit(:description)
  end
end
