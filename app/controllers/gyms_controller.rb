class GymsController < ApplicationController

  def index
    gyms = Gym.all
    render json: gyms
  end

  def show
    gym = Gym.find_by!(id: params[:id])
    render json: gym
  end

end
