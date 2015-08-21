class SessionsController < ApplicationController
	protect_from_forgery with: :exception
  	include SessionsHelper	

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.valid_password?(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      redirect_to root_url
    else
      # Create an error message.
      render 'new'
    end
  end

  def destroy
  end
end
