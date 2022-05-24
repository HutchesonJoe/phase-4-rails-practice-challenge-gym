class MembershipsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_response

  def index
    memberships = Membership.all 
    render json: memberships
  end

  def create
    if client_membership?
      render json: "Membership already exists!"
    else 
      membership = Membership.create(member_params)
      render json: membership, status: :created
    end
  end

  private
  def client_membership?
    client = Client.find(params[:client_id])
    gym = client.gyms.find_by(id: params[:gym_id])
  end

  def member_params
    params.permit(:gym_id, :client_id, :charge)
  end

  def render_not_found_response(invalid)
    render json: { errors: invalid }, status: :not_found
  end

  def record_invalid_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
end
