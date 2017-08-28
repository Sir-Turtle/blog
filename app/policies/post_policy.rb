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
		post.user_id == current_user.id
	end

	def update?
		post.user_id == current_user.id
	end
end
