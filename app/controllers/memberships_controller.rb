class MembershipsController < ApplicationController

  def index
    memberships = Membership.all 
    render json: memberships
  end

  def create
    client = Client.find_by(id: params[:client_id])
    # byebug
    if client.gyms.find(params[:gym_id])
      render json: "Membership exists!"
    else 
      membership = Membership.create(member_params)
      render json: membership, status: :created
    end
  end

  private

  def member_params
    params.permit(:gym_id, :client_id, :charge)
  end
end
