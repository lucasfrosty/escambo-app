module Backoffice::AdminsHelper
	OptionForRoles = Struct.new(:id, :description)

	def options_for_roles

		Admin.roles_i18n.map do |key, value|
			OptionForRoles.new(key, value)
		end

	end

end
