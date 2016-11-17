class UsersController < ApplicationController
  before_action :set_user, only: %i(show update destroy)

  def index
    render json: User.all
  end

  # TODO: Setup authorization. Only admin can create another users
  def create
    # TODO: Add UserService which attach default rooms when creating user
    if @user = User.create!(user_parameters)
      render json: @user, status: :created
    else
      render json: @user.errors.as_json, status: :bad_request
    end
  end

  def show
    render json: @user
  end

  def update
    @user.update_attributes(user_parameters)
    render json: @user
  end

  def destroy
    # TODO: Disable actual user removing. Just set deleted flag
    @user.destroy
    head :no_content
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_parameters
    # TODO: allow to add rooms inline
    params.require(:user)
      .permit(:full_name, :email)
  end

  def series_params
    params.require(:user).permit(:email)
  end
end
