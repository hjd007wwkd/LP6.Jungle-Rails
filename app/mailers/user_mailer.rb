class UserMailer < ApplicationMailer
    default from: 'no-reply@jungle.com'

    def confirmation_email(user, order)
        email = user.email
        @order = order
        @name = user.first_name
        mail(to: email, subject: 'Order Confirmation for #{order.id}')
    end
end
