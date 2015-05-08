class ContactMailer < ActionMailer::Base

  def enquiry_email(email, message, name)
    @email = email
    @message = message
    @name = name

    mail(to: 'svelte@gmail.com', from: 'svelte@gmail.com', subject: 'Enquiry from Svelte Website')
  end

  def confirmation_email(email, name, address, zip, country, order, order_items)
    @email = email
    @name = name
    @address = address
    @zip = zip
    @country = country
    @order = order
    @order_items = order_items

    mail(to: @email, from: 'svelte@gmail.com', subject: 'Confirmation from Svelte Website')
  end

end
