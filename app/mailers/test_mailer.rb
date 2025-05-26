class TestMailer < ApplicationMailer
  def test_email
    mail(
      to: 'florian.wagrez@gmail.com',
      from: 'contact@ncc-industrie.com',
      subject: 'Test Mailgun depuis Heroku',
      body: 'Si tu lis ceci, ton SMTP fonctionne 🎉'
    )
  end
end
