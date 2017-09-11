class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  attr_reader :user, :comment

	def initialize(user, comment)
		@user = user
		@comment = comment
	end

	def edit?
		if(user)
			user.admin? || is_current_user_owner?
		else
			false
		end
	end

	def is_current_user_owner?
		comment.user_id == user.id
	end
end
