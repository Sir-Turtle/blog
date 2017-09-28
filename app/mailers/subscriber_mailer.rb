class SubscriberMailer < ApplicationMailer
	default from: 'notifications@tolgaakkaya.com'
 
	def new_post_notification(user)
    	@user = user
    	@url  = 'http://tolgaakkaya.com/'
    	mail(to: @user.email, subject: 'New Post by Tolga')
	end
end
