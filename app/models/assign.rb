class Assign < ApplicationRecord
	extend FriendlyId
	friendly_id :user_name, use: :slugged

	def user_name
		(User.find(self.user_id)).name_surname
	end
end
