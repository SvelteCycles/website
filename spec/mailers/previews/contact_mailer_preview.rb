# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def enquiry_mail_preview(email, message, name)
    @email = email
    @message = message
    @name = name

    ContactMailer.enquiry_email(@email, @message, @name)
  end
end
