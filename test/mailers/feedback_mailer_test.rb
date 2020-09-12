# frozen_string_literal: true

require 'test_helper'

class FeedbackMailerTest < ActionMailer::TestCase
  test 'sending feedback' do
    feedback = Feedback.new(first_name: 'test',
                            last_name: 'test',
                            phone: 1_234_567_898,
                            email: 'info@gmail.com',
                            message: 'test')

    feedback.save

    email = FeedbackMailer.send_mail(feedback)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['aquilhussain15@gmail.com'], email.from
    assert_equal ['info@ajackus.com'], email.to
    assert_equal 'NEW FEEDBACK', email.subject
  end
end
