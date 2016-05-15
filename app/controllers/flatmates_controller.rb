class FlatmatesController < ApplicationController

   before_action :logged_in_flatmate, only: [:index, :edit, :update, :destroy]
   before_action :correct_flatmate, only: [:edit, :update]
   before_action :admin_flatmate, only: :destroy

  def index
    @flatmates = Flatmate.all
 	#@flatmates = Flatmate.paginate(:page =>params[:page], :per_page =>5)
  end

  def destroy
    Flatmate.find(params[:id]).destroy
    flash[:success] = "Flatmate deleted"
    redirect_to flatmates_url
  end

  def show
    @flatmate = Flatmate.find(params[:id])
  end

  def new
    @flatmate = Flatmate.new
  end

  def create
    @flatmate = Flatmate.new(flatmate_params)
    if @flatmate.save
      log_in @flatmate
      flash[:success] = "Welcome to the Flatmate Helper!"
      redirect_to @flatmate
    else
      render 'new'
    end
  end

  def edit 
 	@flatmate = Flatmate.find(params[:id])
  end

  def update
      @flatmate = Flatmate.find(params[:id])
      if @flatmate.update_attributes(flatmate_params)
	flash[:success] = "Profile update"
        redirect_to @flatmate      
      else
	render 'edit'
      end
  end
        
  private

    def flatmate_params
      params.require(:flatmate).permit(:firstname, :lastname, :phone, :email, :password,
                                   :password_confirmation)
    end

#Before filters
  def logged_in_flatmate
     unless logged_in?
	store_location
	flash[:danger] = "Please log in."
	redirect_to login_url
      end
   end

   def correct_flatmate
	@flatmate = Flatmate.find(params[:id])
	redirect_to(root_irl) unless @flatmate == current_flatmate
   end


end
