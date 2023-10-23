# frozen_string_literal: true

module Fusion
  class Company < ApplicationRecord
    has_one :address, class_name: 'Fusion::Address', as: :addressable, dependent: :destroy
    belongs_to :lead, class_name: 'Fusion::Lead', inverse_of: :company, optional: true

    accepts_nested_attributes_for :address

    validates :address, :legal_name, :incorporation_date, :ein, :phone_work, :email, :type_inc, presence: true

    delegate :state, to: :address

    before_create :encrypt_ein, :find_ein_on_nucleus

    def industry_category
      'other_services'
    end

    def industry
      'all_other_services'
    end

    def status
      'registered_by_admin'
    end

    def encrypt_ein
      self.ein = Fusion.configuration.user_model.encrypt_cpr(ein)
    end

    def find_ein_on_nucleus
      company = Fusion.configuration.company_model.find_by(encrypted_cpr: ein)
      return unless company

      self.nucleus_company_id = company.id
    end

    delegate :broker_id, to: :lead

    delegate :broker_permalink, to: :lead
  end
end
