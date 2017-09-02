class PostPolicy < ApplicationPolicy
	class Scope < Scope
		def resolve
			scope
		end
	end

	attr_reader :user, :post

	def initialize(user, post)
		@user = user
		@post = post
	end

	def edit?
		user.admin?
	end
end
