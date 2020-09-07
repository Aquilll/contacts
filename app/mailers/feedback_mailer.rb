class FeedbackMailer < ApplicationMailer
  def send_mail(feedback)
    @full_name = feedback.full_name
    @email = feedback.email
    @message = feedback.message
    @contact = feedback.phone
    mail(to: CLIENT_EMAIL, subject: "NEW FEEDBACK")
  end
end