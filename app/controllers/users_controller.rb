class UsersController < ApplicationController
  before_action :set_user, only: %i(show update destroy)

  def index
    render json: User.all.as_json
  end

  # TODO: Setup authorization. Only admin can create another users
  def create
    User.create(user_parameters)
  end

  def show
    render json: @user.as_json
  end

  def update
    @user.update_attributes(user_parameters)
  end

  def destroy
    # TODO: Disable actual user removing. Just set deleted flag
    @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_parameters
    # TODO: allow to add rooms inline
    params.require(:user)
      .permit(:full_name, :username)
  end

  def invitation_params
    params.require(:user).permit(:email)
  end
end
