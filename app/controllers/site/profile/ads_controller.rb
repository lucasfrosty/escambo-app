class Site::Profile::AdsController < Site::ProfileController
	before_action :get_ad, only: [:edit, :update]

	def index
		@ads = Ad.finding_member(current_member)
	end

	###########################################

	def edit
	end

	def update
		if @ad.update(params_ad)
			redirect_to_ads("Ad updated!")
 
    else
      render :edit
    end
		
	end

	############################################

	def new
		@ad = Ad.new
	end

	def create 
		@ad = Ad.create(params_ad)
		@ad.member = current_member
		if @ad.save
			redirect_to_ads("Ad created!")
		else
			render :new
		end
	end


	private

	def params_ad
		params.require(:ad).permit(:id, :title, :description, :category_id, :price, :picture)
	end

	def get_ad
		@ad = Ad.find(params[:id])
	end

	def redirect_to_ads(notice)
		redirect_to site_profile_ads_path, notice: notice
	end
end
