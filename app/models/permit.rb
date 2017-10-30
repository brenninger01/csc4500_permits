class Permit < ApplicationRecord
	self.primary_key = :permit_id
	belongs_to	:user
	has_one	:vehicle
end
