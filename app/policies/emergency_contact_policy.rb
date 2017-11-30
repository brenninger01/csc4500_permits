class EmergencyContactPolicy < ApplicationPolicy
	def index?
		true
	end

	def new?
		true
	end

	def create?
		true
	end
	def show?
		return true if (user.present? && user.admin?) || (user.present? && user.editor?)

		user.present? && user == record.user
	end

	def admin_show?
		user.present? && user.admin?
	end

	def destroy?
		false
	end

	def edit?
		#return true if user.present? && user.admin?

		user.present? && user == record.user
	end

	private
		def add
			record
		end

	
end