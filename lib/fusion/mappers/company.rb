# frozen_string_literal: true

module Fusion
  module Mappers
    class Company < Base
      def initialize(fusion_lead)
        @fusion_lead = fusion_lead
        @fusion_company = fusion_lead.company
      end

      def first_name
        @fusion_company.legal_name
      end

      def last_name
        @fusion_company.dba
      end

      def email
        @fusion_company.email
      end

      def birthdate
        @fusion_company.incorporation_date
      end

      def register_as
        'borrower'
      end

      def from_broker_id
        @fusion_company.broker_id
      end

      def default_country_id
        1
      end

      def from_broker_permalink
        @fusion_company.broker_permalink
      end

      # The Employer Identification Number (EIN) gets encrypted and
      # stored in the ein field of the Fusion::Company model.
      # That means we don't need to encrypt it again.
      def encrypted_cpr
        @fusion_company.ein
      end

      def status
        @fusion_company.status
      end

      def state_inc
        @fusion_company.state
      end

      def phone_work
        @fusion_company.phone_work
      end

      def type_inc
        @fusion_company.type_inc
      end

      def industry_category
        @fusion_company.industry_category
      end

      def industry
        @fusion_company.industry
      end

      def owners_attributes
        @fusion_lead.owners.map do |owner|
          Mappers::Owner.data(owner)
        end
      end

      def addresses_attributes
        [Fusion::Mappers::Address.data(@fusion_company.address)]
      end
    end
  end
end
