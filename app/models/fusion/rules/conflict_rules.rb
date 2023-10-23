# frozen_string_literal: true

module Fusion
  module Rules
    class ConflictRules
      attr_accessor :lead

      def initialize(lead)
        @lead = lead
      end

      def duplicate_app?
        false
      end
    end
  end
end
