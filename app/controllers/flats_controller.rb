class FlatsController < ApplicationController

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    if current_flatmate.Flat_id.nil?
      @flat = Flat.new
    else
      @flat = Flat.find(current_flatmate.Flat_id)
      flash[:warning] = "Jesteś już zapisany do mieszkania"
      redirect_to @flat
    end
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
     flash[:success] = "Utworzono mieszkanie"
     current_flatmate.update_attribute(:Flat_id, @flat.id)
     current_flatmate.update_attribute(:admin, true)
     redirect_to @flat
    else
      render 'new'
    end
  end

  def edit
    @flat = Flat.find(params[:id])
    if !current_flatmate.admin?
      flash[:warning] = "Edycję mieszkania może przeprowadzić tylko administrator"
      redirect_to @flat
    end
  end

  def update
    @flat = Flat.find(params[:id])
    if @flat.update_attributes(flat_params)
	flash[:success] = "Zaktualizowano mieszkanie"
        redirect_to @flat
      else
	render 'edit'
      end
  end

  private

    def flat_params
      params.require(:flat).permit(:address, :total_charges)
    end
end
