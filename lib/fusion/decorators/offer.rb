# frozen_string_literal: true

module Fusion
  module Decorators
    module Offer
      # Patching the host app's User model to accept nested attributes for addresses and offers.
      Fusion.configuration.offer_model.class_eval do
        accepts_nested_attributes_for :attachments
        accepts_nested_attributes_for :user
      end
    end
  end
end
