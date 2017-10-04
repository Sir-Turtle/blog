class SubscriberMailer < ApplicationMailer
	default from: 'notifications@tolgaakkaya.com'
 
	def new_subscriber_email(user)
    	@user = user
    	@url  = 'http://tolgaakkaya.com/'
    	mail(to: @user.email, subject: 'Subcribed to Tolga')
	end

	def new_post_email(user)
    	@user = user
    	@url  = 'http://tolgaakkaya.com/'
    	mail(to: @user.email, subject: 'New Post by Tolga')
	end
end
