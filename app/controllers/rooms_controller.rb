class RoomsController < ApplicationController
  before_action :set_room, only: %i(show update destroy)

  def index
    render json: Room.public_rooms
  end

  # TODO: Setup authorization. Only admin can create rooms
  def create
    if @room = Room.create(room_parameters)
      render json: @room, status: :created
    else
      render json: @room.errors.as_json, status: :bad_request
    end
  end

  def show
    render json: @room
  end

  def update
    @room.update_attributes(room_parameters)
    render json: @room
  end

  def destroy
    # TODO: Disable actual room removing. Just set deleted flag
    @room.destroy
    head :no_content
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_parameters
    # TODO: allow to add rooms inline
    params.require(:room)
      .permit(:name, :description, :public)
  end
end
