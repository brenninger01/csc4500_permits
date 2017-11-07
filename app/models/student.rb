class Student < ApplicationRecord
	self.primary_key = :student_id
	belongs_to	:user
	has_one	:vehicle, class_name: 'User'
	has_one	:emergency_contact, class_name: 'User'
	
end
