class Site::CategoriesController < SiteController
	def show
		@categories = Category.order(:description)
		@category = Category.friendly.find(params[:id])
		@ads = Ad.paginate_by_category(@category, params[:page])
	end
end
