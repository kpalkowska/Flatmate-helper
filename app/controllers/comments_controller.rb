class CommentsController < ApplicationController

  def index
    flatmates = Flatmate.where(Flat_id: current_flatmate.Flat_id).select{ |f| f.id }
    @duties = Duty.where(Flatmate_id: flatmates)
    @comments = Comment.where(Flatmate_id: flatmates).order('updated_at DESC')
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.update_attribute(:Flatmate_id, current_flatmate.id)
    if @comment.save
     flash[:success] = "Utworzono notatkę"
     redirect_to @comment
    else
      render 'new'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
	flash[:success] = "Zaktualizowano notatkę"
        redirect_to @comment
      else
	render 'edit'
      end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.Flatmate_id == current_flatmate.id || current_flatmate.admin?
      comment.destroy
      flash[:success] = "Notatka usunięta"
      redirect_to root_url
    else
      flash[:danger] = "Nie możesz usunąć tej notatki"
      redirect_to @comment
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:category, :comment_content)
    end
end
