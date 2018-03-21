class DeliveryboyMailer < ApplicationMailer

	def deliveryboy_registration_mail(delivery_boy)
		@delivery_boy = delivery_boy
		mail(to: @delivery_boy.email, subject: 'Credentials of Online-Restaurant-Management')		
	end
end
