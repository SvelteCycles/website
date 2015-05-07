class ContactController < ApplicationController

  def index
  end

  def create
    user = params[:user]
    @email = user[:address]
    @message = params[:message]
    @name = params[:name]

    ContactMailer.enquiry_email(@email, @message, @name).deliver_now

    redirect_to '/'
  end

end
