# frozen_string_literal: true

module Fusion
  class Lead < ApplicationRecord
    has_one :company, class_name: 'Fusion::Company', dependent: :destroy
    has_one :offer, class_name: 'Fusion::Offer', dependent: :destroy
    has_many :owners, class_name: 'Fusion::Owner', dependent: :destroy
    has_many :engine_runs, dependent: :destroy
    belongs_to :broker, dependent: :destroy, optional: true

    accepts_nested_attributes_for :company, :offer, :owners

    delegate :permalink, to: :broker, prefix: true
  end
end
