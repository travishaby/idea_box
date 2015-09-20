class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(user_added_params)
    if @idea.save
      flash[:notice] = "Idea successfully created!"
      redirect_to user_ideas_path
    else
      flash[:error] = "Creation unsuccessful. Please try again."
      redirect_to new_user_idea_path
    end
  end

  private

    def idea_params
      params.require(:idea).permit(:name, :description, :category_id)
    end

    def user_added_params
      full_params = idea_params
      full_params[:user_id] = current_user.id
      full_params
    end

end
