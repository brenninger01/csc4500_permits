class Student < ApplicationRecord
	self.primary_key = :student_id
	belongs_to	:user, optional: true
	has_one	:vehicle
	has_one	:emergency_contact

	def self.search(search)
		where("last_name LIKE ? OR first_name LIKE ? OR student_id LIKE ?",
			"%#{search}%", "%#{search}", "%#{search}%")
	end

end
