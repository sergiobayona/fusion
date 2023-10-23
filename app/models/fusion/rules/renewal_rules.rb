# frozen_string_literal: true

module Fusion
  module Rules
    class RenewalRules
      attr_accessor :lead

      def initialize(lead)
        @lead = lead
      end

      # investigate the proper conditions for a loan to be renewable
      def renewable?
        return true unless previous_borrower && previous_loans?

        last_loan.renewable?
      end

      def not_renewable?
        !renewable?
      end

      def previous_borrower
        @previous_borrower ||= User.find_by(encrypted_cpr: encrypted_cpr)
      end

      def previous_loans?
        previous_borrower.loans.any?
      end

      def last_loan
        previous_borrower.loans.last
      end

      delegate :company, to: :lead, prefix: true

      def lead_ein
        lead_company.ein
      end

      def encrypted_cpr
        @encrypted_cpr ||= User.encrypt_cpr(lead_ein)
      end

      def past_due_loan?
        false
      end

      def not_original_broker?
        false
      end
    end
  end
end
