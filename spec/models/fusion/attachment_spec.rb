# frozen_string_literal: true

require 'rails_helper'

module Fusion
  RSpec.describe Attachment, type: :model do
    let(:file) { fixture_file_upload('spec/fixtures/bank_statement.jpg') }
    let(:offer) { stub_model(Fusion::Offer) }

    it 'is valid with valid attributes' do
      attrs = {
        file: file,
        file_type: 'bank_statement'
      }
      attachment = described_class.new(attrs)
      attachment.offer = offer
      expect(attachment).to be_valid
    end
  end
end
