# frozen_string_literal: true

module Fusion
  module Rules
    class MerchantRules
      attr_accessor :lead

      def initialize(lead)
        @lead = lead
      end

      def merchant
        User.where(id: lead.broker_id)
      end

      delegate :valid?, to: :broker
    end
  end
end
