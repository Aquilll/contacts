# frozen_string_literal: true

# this is a contact controller
class ContactsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # get /
  def index; end

  # post /contacts
  def create
    @feed_back = Feedback.new(feedback_params)
    if @feed_back.save
      redirect_to contacts_path, flash: { success: 'Your message was successfully sent' }
      FeedbackMailer.send_mail(@feed_back).deliver_now
    else
      redirect_to contacts_path, flash: { error: @feed_back.errors.full_messages }
    end
  end

  # add strong parameters
  def feedback_params
    params.permit(:first_name, :last_name, :email, :phone, :message)
  end
end
