class Faculty < ApplicationRecord
	self.primary_key = :faculty_id
	belongs_to	:user
	has_many	:vehicles
	has_one	:emergency_contact
end
