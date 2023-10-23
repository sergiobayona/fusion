# frozen_string_literal: true

module Fusion
  module Mappers
    # The instance methods of this class are used to map the data from
    # the Fusion::Owner model to the Nucleus User model.
    class Owner < Base
      def initialize(fusion_owner)
        @fusion_owner = fusion_owner
      end

      def first_name
        @fusion_owner.first_name
      end

      def last_name
        @fusion_owner.last_name
      end

      def email
        @fusion_owner.email
      end

      def register_as
        'owner'
      end

      def status
        'owner'
      end

      def default_country_id
        1
      end

      # The SSN gets encrypted and stored in the ssn field of the Fusion::Owner model.
      # That means we don't need to encrypt it again.
      def encrypted_cpr
        @fusion_owner.ssn
      end

      def phone_mobile
        @fusion_owner.phone_mobile
      end

      def contact_phone
        @fusion_owner.phone_mobile
      end

      def phone
        @fusion_owner.phone
      end

      def birthdate
        @fusion_owner.birthdate
      end

      def heard_from
        'Other'
      end

      def owner_percent
        @fusion_owner.owner_percent
      end

      def annotations
        @fusion_owner.annotations
      end

      # def primary_owner
      #   @fusion_owner.primary_owner
      # end

      def addresses_attributes
        [Mappers::Address.data(@fusion_owner.address)]
      end
    end
  end
end
