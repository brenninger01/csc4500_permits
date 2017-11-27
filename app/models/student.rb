class Student < ApplicationRecord
	self.primary_key = :student_id
	belongs_to	:user, optional: true
	has_one	:vehicle
	has_one	:emergency_contact


end
