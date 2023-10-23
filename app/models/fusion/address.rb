# frozen_string_literal: true

module Fusion
  class Address < ApplicationRecord
    belongs_to :addressable, class_name: 'Fusion::Address', polymorphic: true

    validates :street_number, :street_name, :city, :state, :zip, presence: true

    def country_id
      1
    end
  end
end
