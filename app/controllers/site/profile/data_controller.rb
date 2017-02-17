class Site::Profile::DataController < Site::ProfileController
	before_action :get_profile_member, only: [:edit, :update]

	def edit
	end

	def update
		if @profile_member.update(params_profile)
			redirect_to_profile("Profile updated!")	
		else
			render :edit
		end
		
	end

	private

	def get_profile_member
		@profile_member = ProfileMember.find_or_create_by(member_id: current_member.id)
	end

	def params_profile
		params.require(:profile_member).permit(:id, :first_name, :second_name, :birthdate)
	end

	def redirect_to_profile(notice)
		redirect_to site_profile_dashboard_index_path, notice: notice
	end

end

