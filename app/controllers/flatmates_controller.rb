class FlatmatesController < ApplicationController

   before_action :logged_in_flatmate, only: [:index, :edit, :update, :destroy]
   before_action :correct_flatmate, only: [:edit, :update]
   before_action :admin_flatmate, only: :destroy

  def home
    if logged_in?
      redirect_to(comments_url)
    else
      redirect_to(main_url)
    end 
  end

  def index
    @flatmates = Flatmate.where(Flat_id: current_flatmate.Flat_id).order('LastName ASC')
  end

  def destroy
    Flatmate.find(params[:id]).destroy
    flash[:success] = "Lokator usunięty"
    redirect_to flatmates_url
  end

  def show
    @flatmate = Flatmate.find(params[:id])
  end

  def new
    if current_flatmate == nil || current_flatmate.admin?
      @flatmate = Flatmate.new
    else
      flash[:warning] = "Nie możesz dodawać nowych lokatorów"
      redirect_to root_url
    end
  end

  def create
    @flatmate = Flatmate.new(flatmate_params)
    @flatmate.update_attribute(:charges, 0)
    if @flatmate.save
	if !logged_in?
     	   log_in @flatmate
           flash[:success] = "Witamy w aplikacji Flatmate Helper!"
           redirect_to new_flat_url
	else
	   @flatmate.update_attribute(:Flat_id, current_flatmate.Flat_id)
	   redirect_to @flatmate
	end
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
	flash[:success] = "Zaktualizowano profil"
        redirect_to @flatmate
      else
	render 'edit'
      end
  end

#Before filters
  def logged_in_flatmate
     unless logged_in?
	#store_location
	flash[:danger] = "Proszę się zalogować"
	redirect_to login_url
      end
  end

  def correct_flatmate
	@flatmate = Flatmate.find(params[:id])
	redirect_to(root_url) unless @flatmate == current_flatmate || current_flatmate.admin?
  end

  private

    def flatmate_params
      params.require(:flatmate).permit(:firstname, :lastname, :phone, :email, :password,
                                   :password_confirmation, :charges, :is_payed)
    end

    def admin_flatmate
      redirect_to(root_url) unless current_flatmate.admin?
    end
end
