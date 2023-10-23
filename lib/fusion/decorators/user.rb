# frozen_string_literal: true

module Fusion
  module Decorators
    module User
      # Patching the host app's User model to accept nested attributes for addresses and offers.
      Fusion.configuration.user_model.class_eval do
        # assumes all the associations are already defined

        # TODO: This is a hack to avoid the following error:
        # ArgumentError:
        # No association found for name `addresses'.
        # which only happens when running the specs.
        # and it is due to the way we load the models dependencies.
        # See initializers/active_record.rb `concerned_with` method.
        has_many :addresses if reflect_on_association(:addresses).nil?

        has_many :owners, class_name: 'User', foreign_key: 'parent_id' if reflect_on_association(:owners).nil?

        accepts_nested_attributes_for :addresses
        accepts_nested_attributes_for :owners
      end
    end
  end
end
