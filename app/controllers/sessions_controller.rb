class SessionsController < ApplicationController
  def new
  end

  def create
    flatmate = Flatmate.find_by(email: params[:session][:email].downcase)
    if flatmate && flatmate.authenticate(params[:session][:password])
      log_in flatmate
      if flatmate.Flat_id.nil?
        redirect_to new_flat_url
      else
        redirect_to flatmate
      end
    else
      flash.now[:danger] = 'Błędny email lub hasło'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end

