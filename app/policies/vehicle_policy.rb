class VehiclePolicy < ApplicationPolicy
	def index?
		true
	end

	def new?
		true
	end

	def create?
		true
	end

	def admin_show?
		user.present? && user.admin?
	end

	def destroy?
		user.present? && user.admin?
	end

	def edit?
		return true if (user.present? && user.admin?) || (user.present? && user.editor?) 
		user.present? && user == record.user
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