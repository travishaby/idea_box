class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:error] = "Successfully created!"
      redirect_to admin_categories_path
    else
      flash[:error] = "You need to enter a name."
      redirect_to admin_categories_path
    end
  end

  def edit
    @category = Category.find(params[:id])
    session[:category_id] = @category.id
  end

  def update
    if params[:category][:name] != ""
      Category.find(session[:category_id]).update(name: params[:category][:name])
      category = Category.find(session[:category_id])
      redirect_to admin_category_path(category)
    else
      flash[:error] = "You must enter a name!"
      redirect_to edit_admin_category_path(session[:category_id])
    end
  end

  def destroy
    category = Category.find(params[:id]).destroy
    flash[:error] = "Deleted the category '#{category.name}'!"
    redirect_to admin_categories_path
  end

private

  def category_params
    params.require(:category).permit(:name)
  end

end
