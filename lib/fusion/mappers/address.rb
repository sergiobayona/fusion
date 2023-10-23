# frozen_string_literal: true

module Fusion
  module Mappers
    # The instance methods of this class are used to map the data from the
    # Fusion::Address model to the Nucleus Address model.
    # the method names must match the attribute
    class Address < Base
      def initialize(fusion_address)
        @fusion_address = fusion_address
      end

      def civic
        @fusion_address.street_number
      end

      def street
        @fusion_address.street_name
      end

      def unit
        @fusion_address.unit
      end

      def city
        @fusion_address.city
      end

      def province
        @fusion_address.state
      end

      def zip
        @fusion_address.zip
      end
    end
  end
end
