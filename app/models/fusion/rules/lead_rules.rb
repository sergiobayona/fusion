# frozen_string_literal: true

module Fusion
  module Rules
    class LeadRules
      attr_accessor :lead

      def initialize(lead)
        @lead = lead
      end

      def invalid_industry?
        false
      end

      def merchant_too_recent?
        false
      end

      def owner_too_young?
        false
      end

      def invalid_state?
        false
      end
    end
  end
end
