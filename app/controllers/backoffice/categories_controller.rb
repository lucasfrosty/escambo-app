class Backoffice::CategoriesController < BackofficeController
  before_action :get_category, only: [:edit, :update]

  def index
  	@categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = CategoryService.create(params_category)

    unless @category.errors.any?
      redirect_to backoffice_categories_path, notice: "Category created! (#{@category.description})"
    else 
      render :new
    end

  end

  def edit
  end

  def update
    @category.update(params_category)
    if @category.save
      redirect_to backoffice_categories_path, notice: "Category updated!"
    else
      render :edit
    end
  end

  private
  def get_category
    @category = Category.friendly.find(params[:id])
  end

  def params_category
    params.require(:category).permit(:description)
  end
end
