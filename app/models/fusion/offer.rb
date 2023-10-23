# frozen_string_literal: true

module Fusion
  class Offer < ApplicationRecord
    validates :amount, :purpose, :description, :length_max, :pmt_frequency, presence: true
    has_many :attachments, class_name: 'Fusion::Attachment', dependent: :destroy
    belongs_to :lead, class_name: 'Fusion::Lead', inverse_of: :offer, optional: true

    accepts_nested_attributes_for :attachments

    def cached_state; end

    delegate :broker_id, to: :lead

    def company_id
      lead.company.id
    end
  end
end
