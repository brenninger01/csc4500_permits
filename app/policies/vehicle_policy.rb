class VehiclePolicy < ApplicationPolicy
	def index?
		true
	end

	def new?
		if (user.faculty? && user.vehicles.count <2)
			true
		elsif (user.student? && user.vehicles.count <1)
			true
		elsif (user.admin? || user.editor?)
			true
		else
			false
		end

	end

	def create?
		if (user.faculty? && user.vehicles.count <2)
			true
		elsif (user.student? && user.vehicles.count <1)
			true
		elsif (user.admin? || user.editor?)
			true
		end
	end

	def admin_show?
		user.present? && user.admin?
	end

	def destroy?
		false
	end

	def edit?
		false
	end
	
	def update?
		false
	end

	def show?
		return true if (user.present? && user.admin?) || (user.present? && user.editor?) 
		user.present? && user == record.user
	end


	private
		def add
			record
		end

	
end