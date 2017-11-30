class FacultyPolicy < ApplicationPolicy
	def index?
		return true if (user.present? && user.admin?) || (user.present? && user.editor?)

		user.present? && user.faculty?
	end

	def new?
		return true if (user.present? && user.admin?) || (user.present? && user.editor?)

		user.present? && user.faculty?
	end

	def create?
		return true if (user.present? && user.admin?) || (user.present? && user.editor?)

		user.present? && user.faculty?
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
		#return true if (user.present? && user.admin?) || (user.present? && user.editor?)

		user.present? && user == record.user
	end

	private
		def add
			record
		end

	
end