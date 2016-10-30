class InvitationsController < ApplicationController
  before_action :set_invitation, only: %i(show update destroy)

  def index
    render json: Invitation.all
  end

  def create
    if @invite = Invitation.create(invitation_params)
      render json: @invite, status: :created
    else
      render json: @invite&.errors&.as_json, status: :bad_request
    end
  end

  def show
    render json: @invite
  end

  def update
    if @invite = @invite.update_attributes(invitation_params)
      render json: @invite, status: :ok
    else
      render json: @invite&.errors&.as_json, status: :bad_request
    end
  end

  private

  def set_invitation
    @invite ||= Invitation.find(params[:id])
  end

  def invitation_params
    params.require(:invitation).permit(:message)
  end
end
