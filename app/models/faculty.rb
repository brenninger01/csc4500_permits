class Faculty < ApplicationRecord
	self.primary_key = :faculty_id
	belongs_to	:user
	has_many	:vehicles, class_name: 'User'
	has_one	:emergency_contact, class_name: 'User'
end
