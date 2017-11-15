class Vehicle < ApplicationRecord
	self.primary_key = :vehicle_id
	belongs_to	:user, optional: true
	belongs_to	:student, optional: true
	belongs_to	:faculty, optional: true
	belongs_to	:permit, optional: true

	def self.search(search)
		where("license_number LIKE ? OR permit_id LIKE ? OR student_id LIKE ? OR faculty_id LIKE ?", 
			"%#{search}%", "%#{search}", "%#{search}%", "%#{search}")
	end
end
