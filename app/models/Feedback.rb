# frozen_string_literal: true

class Feedback < ApplicationRecord
  validates :first_name, :last_name, :phone, :email, presence: true
  validates :phone, uniqueness: true, numericality: true, length: { minimum: 10, maximum: 13 }
  validates :email, uniqueness: true, presence: true, length: { minimum: 3, maximum: 60 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def full_name
    "#{first_name} #{last_name}"
  end
end
