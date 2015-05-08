require "rails_helper"

RSpec.describe ContactMailer, type: :mailer do

  describe 'contents' do
    let(:mail) {ContactMailer.enquiry_email('user@svelte.com', 'Test Enquiry', 'Svelte User')}

    it 'renders the subject' do
      expect(mail.subject).to eq('Enquiry from Svelte Website')
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match('Svelte User')
    end

    it 'assigns @message' do
      expect(mail.body.encoded).to match('Test Enquiry')
    end

    it 'assigns @email' do
      expect(mail.body.encoded).to match('user@svelte.com')
    end
  end
  
end
