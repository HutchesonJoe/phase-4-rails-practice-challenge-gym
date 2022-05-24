class GymsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_response

  def index
    gyms = Gym.all
    render json: gyms
  end

  def show
    gym = Gym.find_by!(id: params[:id])
    render json: gym
  end

  def destroy
    gym = Gym.find_by!(id: params[:id])
    gym.destroy
    render json: {}, status: 200
  end

  private

  def render_not_found_response(invalid)
    render json: { errors: invalid }, status: :not_found
  end

  def record_invalid_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end


end
