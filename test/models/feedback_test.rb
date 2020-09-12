# frozen_string_literal: true

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test 'should not save feedback with random email' do
    feedback = Feedback.new(first_name: 'test',
                            last_name: 'test',
                            phone: 1_234_567_898,
                            email: 'random',
                            message: 'test')

    assert_not feedback.save
  end

  test 'should not save feedback with no parameters' do
    feedback = Feedback.new
    assert_not feedback.save
  end

  test 'should not save feedback with less then 10 digit number' do
    feedback = Feedback.new
    assert_not feedback.save
  end

  test 'should not save feedback with more then 13 digit number' do
    feedback = Feedback.new(phone: 1_234_567_878_676)
    assert_not feedback.save
  end

  test 'should not save feedback with same phone' do
    feedback1 = Feedback.new(first_name: 'test',
                             last_name: 'test',
                             phone: 1_234_567_898,
                             email: 'abc@gmail.com',
                             message: 'test')

    feedback1.save

    feedback2 = Feedback.new(first_name: 'test',
                             last_name: 'test',
                             phone: 1_234_567_898,
                             email: 'abcd@gmail.com',
                             message: 'test')

    assert_not feedback2.save
  end

  test 'should not save feedback with same email' do
    feedback1 = Feedback.new(first_name: 'test',
                             last_name: 'test',
                             phone: 1_234_567_898,
                             email: 'abc@gmail.com',
                             message: 'test')

    feedback1.save

    feedback2 = Feedback.new(first_name: 'test',
                             last_name: 'test',
                             phone: 1_234_567_888,
                             email: 'abc@gmail.com',
                             message: 'test')

    assert_not feedback2.save
  end
end
