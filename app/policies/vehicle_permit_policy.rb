class VehiclePermitPolicy < ApplicationPolicy
	def index?
		return true if user.admin? || user.editor?
	end

	def new?
		return true if user.admin? || user.editor?
	end

	def create?
		return true if user.admin? || user.editor?
	end

	def admin_show?
		user.present? && user.admin?
	end

	def destroy?
		user.present? && user.admin?
	end

	def edit?
		return true if user.admin? || user.editor?

		return true if user.present? && user.admin?
	end

	def update?
		return true if user.admin? || user.editor?

	end

	private
		def add
			record
		end

	
end