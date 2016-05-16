class FlatsController < ApplicationController

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
     flash[:success] = "Flat created successfully"
     current_flatmate.update_attribute(:Flat_id, @flat.id)
     current_flatmate.update_attribute(:admin, true)
     redirect_to @flat
    else
      render 'new'
    end
  end

  private

    def flat_params
      params.require(:flat).permit(:address, :total_charges)
    end
end


