# frozen_string_literal: true

module Fusion
  module Rules
    class BrokerRules
      attr_accessor :lead

      def initialize(lead)
        @lead = lead
      end

      def broker
        User.where(id: lead.broker_id)
      end

      def unlicensed?
        broker.unlicensed?
      end

      def blocked?
        broker.blocked?
      end

      def not_a_broker?
        false
      end
    end
  end
end
