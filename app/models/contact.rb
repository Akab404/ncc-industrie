class Contact < MailForm::Base
  attribute :name,      validate: true
  attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   validate: true
  attribute :nickname,  captcha: true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Nouveau message depuis NCC Website",
      to: ["contact@ncc-industrie.com", "rh@ncc-industrie.com"],
      :cci => "florian.wagrez@gmail.com",
      :from => 'contact@ncc-industrie.com',
      :reply_to => email
    }
  end
end
