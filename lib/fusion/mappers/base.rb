# frozen_string_literal: true

module Fusion
  module Mappers
    class Base
      def self.data(fusion_object)
        map = new(fusion_object)
        Hash[instance_methods(false).map { |method_name| [method_name, map.send(method_name)] }]
      end
    end
  end
end
