class VehiclePermit < ApplicationRecord
	self.primary_key = :vehicle_permit_id
	belongs_to	:user, optional: true
	has_one	:vehicle
	accepts_nested_attributes_for :vehicle

	def self.search(search)
		where("vehicle_permit_id LIKE ? OR issued_by LIKE ? OR entered_by LIKE ?", 
			"%#{search}%", "%#{search}", "%#{search}%")
	end
end
