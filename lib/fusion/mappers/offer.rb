# frozen_string_literal: true

module Fusion
  module Mappers
    class Offer < Base
      def initialize(fusion_lead)
        @fusion_lead = fusion_lead
        @fusion_offer = fusion_lead.offer
        @fusion_company = fusion_lead.company
      end

      # def offer_state
      #   "dummy"
      # end

      def from_broker_id
        @fusion_lead.broker_id
      end

      def amount
        @fusion_offer.amount
      end

      def length_max
        @fusion_offer.length_max
      end

      def pmt_frequency
        @fusion_offer.pmt_frequency
      end

      def description
        @fusion_offer.description
      end

      def purpose
        @fusion_offer.purpose
      end

      def cached_state
        @fusion_company.state
      end

      def application_date
        Time.zone.now
      end

      # Assign attributes of the Fusion::Company as user_attributes.
      def user_attributes
        Mappers::Company.data(@fusion_lead)
      end

      def attachments_attributes
        @fusion_offer.attachments.map do |doc|
          Mappers::Attachment.data(doc)
        end
      end
    end
  end
end
