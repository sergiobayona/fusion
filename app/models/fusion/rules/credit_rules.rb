# frozen_string_literal: true

module Fusion
  module Rules
    class CreditRules
      attr_accessor :lead

      def initialize(lead)
        @lead = lead
      end

      def bad_credit?
        false
      end
    end
  end
end
