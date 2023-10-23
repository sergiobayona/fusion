# frozen_string_literal: true

require 'rails_helper'

# MockValidator is just a shell class so that we can
# include the rules engine and test its features.

module Fusion
  describe PipelineHandover do
    subject(:pipeline) { described_class }
    let(:broker) { stub_model(Broker, id: 123) }
    let(:lead) { create(:lead, broker: broker) }

    it 'returns an offer' do
      p = pipeline.new(lead)
      offer = p.create_offer
      expect(offer.class.name).to eq('Offer')
    end

    it 'creates a fusion company record' do
      p = pipeline.new(lead)
      expect do
        p.create_lead
      end.to change(Fusion.configuration.company_model, :count).by(1)
    end
  end
end
