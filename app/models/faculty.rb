class Faculty < ApplicationRecord
	self.primary_key = :faculty_id
	belongs_to	:user, optional: true
	has_many	:vehicles
	has_one	:emergency_contact

	def self.search(search)
		where("faculty_id LIKE ? OR last_name LIKE ? OR first_name LIKE ?",
		 "%#{search}%", "%#{search}", "%#{search}%")
	end
end
