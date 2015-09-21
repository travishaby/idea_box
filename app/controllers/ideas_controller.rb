class IdeasController < ApplicationController

  def index
    @ideas = current_user.ideas
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

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    if valid_idea_params
      Idea.find(params[:id]).update(user_added_params)
      idea = Idea.find(params[:id])
      redirect_to user_ideas_path(current_user)
    else
      flash[:error] = "You must enter a name and a description!"
      redirect_to edit_user_idea_path(current_user, params[:user_id])
    end
  end

  def destroy
    Idea.find(params[:id]).delete
    redirect_to user_ideas_path(current_user)
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

    def valid_idea_params
      (params[:idea][:name] && params[:idea][:description]) != ""
    end

end
