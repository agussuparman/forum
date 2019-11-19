class ForumThreadPolicy < ApplicationPolicy
	def edit?
		#false
		user.id == record.user.id || user.admin?
	end

	def update?
		user.id == record.user.id || user.admin?
	end

	def destroy?
		user.admin?
	end
end