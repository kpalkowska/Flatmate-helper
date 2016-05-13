class FlatmatesController < ApplicationController

  def show
    @flatmate = Flatmate.find(params[:id])
  end

  def new
    @flatmate = Flatmate.new
  end

  def create
    @flatmate = Flatmate.new(flatmate_params)
    if @flatmate.save
      flash[:success] = "Welcome to the Flatmate Helper!"
      redirect_to @flatmate
    else
      render 'new'
    end
  end

  private

    def flatmate_params
      params.require(:flatmate).permit(:firstname, :lastname, :phone, :email, :password,
                                   :password_confirmation)
    end
end
