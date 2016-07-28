class RegistrationController < ApplicationController
  def invite
    confirmation_code = SecureRandom.hex(4).upcase
    @user = User.create!(confirmation_code: confirmation_code, **invitation_params.symbolize_keys)

    RegistrationMailer.invite(@user).deliver

    head :ok
  end

  def confirm
    @user = User.find_by!(confirmation_code: params[:code])

    render json: { message: 'Already confirmed' } and return if @user.confirmed?

    @user.confirm_email!

    temporary_password = SecureRandom.hex(6)
    @user.update_attributes(password: temporary_password)

    RegistrationMailer.send_password(user, temporary_password).deliver

    head :ok
  end

  private

  def invitation_params
    params.permit(:email)
  end
end
