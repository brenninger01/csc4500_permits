class Vehicle < ApplicationRecord
	self.primary_key = :vehicle_id
	belongs_to	:user
	belongs_to	:student, optional: true
	belongs_to	:faculty, optional: true
	belongs_to	:permit, optional: true
end
