# frozen_string_literal: true

module Fusion
  class Owner < ApplicationRecord
    has_one :address, as: :addressable, class_name: 'Fusion::Address', dependent: :destroy

    accepts_nested_attributes_for :address

    validates :address, :first_name, :last_name, :email, :phone_mobile, :birthdate, :ssn, :owner_percent,
              presence: true

    before_create :encrypt_ssn, :find_ssn_on_nucleus

    def encrypt_ssn
      self.ssn = Fusion.configuration.user_model.encrypt_cpr(ssn)
    end

    def annotations
      [owner_percent: owner_percent]
    end

    def find_ssn_on_nucleus
      user = Fusion.configuration.user_model.find_by(encrypted_cpr: ssn)
      return unless user

      self.nucleus_user_id = user.id
    end
  end
end
