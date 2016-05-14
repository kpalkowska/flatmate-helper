class SessionsController < ApplicationController
  def new
  end

  def create
    flatmate = Flatmate.find_by(email: params[:session][:email].downcase)
    if flatmate && flatmate.authenticate(params[:session][:password])
      log_in flatmate
      redirect_to flatmate
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
