# frozen_string_literal: true

require_relative 'mappers/base'
require_relative 'mappers/company'
require_relative 'mappers/address'
require_relative 'mappers/owner'
require_relative 'mappers/offer'
require_relative 'mappers/attachment'
module Fusion
  class PipelineHandover
    attr_reader :fusion_lead, :fusion_company, :fusion_offer

    def initialize(fusion_lead)
      @fusion_lead = fusion_lead
      @fusion_company = fusion_lead.company
      @fusion_offer = fusion_lead.offer
    end

    def create_offer
      offer_data = Mappers::Offer.data(fusion_lead)
      offer = offer_model.new(offer_data)

      # if the company already exists, we need to assign the offer to the existing company
      if fusion_company.nucleus_company_id.present?
        company = User.find_by(id: fusion_company.nucleus_company_id)
        offer.user = company if company.present?
      end

      # also, if the owners exist already, we need to assign them to the company
      fusion_lead.owners.each do |owner|
        next unless owner.nucleus_user_id.present? && company.present?

        owner = User.find_by(id: owner.nucleus_user_id)
        company.owners << owner if owner.present?
      end

      offer.save!

      fusion_offer.update(nucleus_offer_id: offer.id)
      offer
    end

    def offer_model
      Fusion.configuration.offer_model
    end
  end
end
