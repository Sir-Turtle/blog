class User < ApplicationRecord

	enum role: [:reader, :admin]
	after_initialize :set_default_role, :if => :new_record?

 	# Include default devise modules. Others available are:
 	# :confirmable, :lockable, :timeoutable and :omniauthable
 	devise :database_authenticatable, :registerable, :recoverable, 
 		:rememberable, :trackable, :validatable, :lockable

	has_many :posts
	has_many :comments

	def set_default_role
		self.role ||= :reader
	end
end
