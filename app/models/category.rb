class Category < ApplicationRecord
	
	# Using Friendly ID
	include FriendlyId
	friendly_id :description, use: :slugged

	has_many :ads
	validates_presence_of :description

	
end
