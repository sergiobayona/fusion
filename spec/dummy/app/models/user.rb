# frozen_string_literal: true

class User < ApplicationRecord
  # used by the Fusion::Mappers::Owner class
  # It is also a required attribute for the User model.
  attr_accessor :contact_phone, :owner_percent

  has_many :offers
  has_many :addresses
  has_many :owners, class_name: 'User', foreign_key: 'parent_id'

  # stub method to simulate encrypting an EIN
  class << self
    def encrypt_cpr(ein)
      ein
    end

    alias encrypt encrypt_cpr
  end

  def set_login_name; end

  def password=(new_password); end

  def password_confirmation=(new_password_confirmation); end
end
