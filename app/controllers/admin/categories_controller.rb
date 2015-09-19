class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
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

private

  def category_params
    params.require(:category).permit(:name)
  end

end
