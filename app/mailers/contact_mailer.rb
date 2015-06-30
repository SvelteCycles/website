class ContactMailer < ActionMailer::Base

  def enquiry_email(email, message, name)
    @email = email
    @message = message
    @name = name

    mail(to: 'info@svelte-cycles.com', from: 'info@svelte-cycles.com',
          subject: 'Enquiry from Svelte Website')
  end

  def customer_confirmation(email, name, address, zip, country, order, order_items)
    @email = email
    @name = name
    @address = address
    @zip = zip
    @country = country
    @order = order
    @order_items = order_items

    mail(to: @email, bcc:'pellicena@gmail.com', from: 'info@svelte-cycles.com',
          subject: 'Confirmation from Svelte Website')
  end

  def svelte_confirmation(email, name, address, zip, country, order, order_items)
    @email = email
    @name = name
    @address = address
    @zip = zip
    @country = country
    @order = order
    @order_items = order_items

    mail(to: 'pellicena@gmail.com', from: 'info@svelte-cycles.com',
          subject: 'Order confirmation from Svelte Website')
  end

end
