# frozen_string_literal: true

module Fusion
  module Mappers
    # The instance methods of this class are used to map the
    # data from the Fusion::Attachment model to the Nucleus Attachment model.
    # the method names must match the attribute
    class Attachment < Base
      def initialize(fusion_attachment)
        @fusion_attachment = fusion_attachment
        @fusion_offer = fusion_attachment.offer
      end

      def title
        'no title'
      end

      def file
        @fusion_attachment.file
      end

      def note
        { 'doc_checklist' => [@fusion_attachment.file_type] }
      end

      def user_id
        @fusion_offer.broker_id
      end
    end
  end
end
