class Contact < MailForm::Base
  attribute :name,      validate: true
  attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   validate: true
  attribute :nickname,  captcha: true

  def headers
    Rails.logger.info "→ Préparation de l'envoi de mail avec MailForm"
    {
      subject: "Nouveau message depuis NCC Website",
      to: ["contact@ncc-industrie.com", "rh@ncc-industrie.com"],
      bcc: "florian.wagrez@gmail.com",
      from: 'contact@ncc-industrie.com',
      reply_to: email
    }
  end
end
