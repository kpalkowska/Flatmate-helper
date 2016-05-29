class DutiesController < ApplicationController

  def index
    @duties = Duty.where(Flatmate_id: current_flatmate.id)
  end

  def show
    @duty = Duty.find(params[:id])
  end

  def new
    @duty = Duty.new    
  end

  def create
    @duty = Duty.new(duty_params)
    @duty.update_attribute(:Flatmate_id, current_flatmate.id)
    if @duty.save
     flash[:success] = "Utworzono zadanie"
     redirect_to @duty
    else
      render 'new'
    end
  end

  def edit
    @duty = Duty.find(params[:id])
  end

  def update
    @duty = Duty.find(params[:id])
    if @duty.update_attributes(duty_params)
	flash[:success] = "Zaktualizowano zadanie"
        redirect_to @duty
      else
	render 'edit'
      end
  end

  def destroy
    duty = Duty.find(params[:id])
    if duty.Flatmate_id == current_flatmate.id || current_flatmate.admin?
      duty.destroy
      flash[:success] = "Zadanie usunięte"
      redirect_to root_url
    else
      flash[:danger] = "Nie możesz usunąć tego zadania"
      redirect_to @duty
    end
  end


  private

    def duty_params
      params.require(:duty).permit(:description, :day)
    end
end
