class SeriesController < ApplicationController
  before_action :set_series, only: %i(show update destroy)

  def index
    render json: Series.all
  end

  def create
    if @invite = Series.create(series_params)
      render json: @invite, status: :created
    else
      render json: @invite&.errors&.as_json, status: :bad_request
    end
  end

  def show
    render json: @invite
  end

  def update
    if @invite = @invite.update_attributes(series_params)
      render json: @invite, status: :ok
    else
      render json: @invite&.errors&.as_json, status: :bad_request
    end
  end

  private

  def set_series
    @invite ||= Series.find(params[:id])
  end

  def series_params
    params.require(:series).permit(:message)
  end
end
