class StudentPolicy < ApplicationPolicy
	def index?
		return true if (user.present? && user.admin?) || (user.present? && user.editor?)

		user.present? && user.student?
	end

	def new?
		return true if (user.present? && user.admin?) || (user.present? && user.editor?)

		user.present? && user.student?
	end

	def create?
		return true if (user.present? && user.admin?) || (user.present? && user.editor?)

		user.present? && user.student?
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