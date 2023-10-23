# frozen_string_literal: true

require 'rails_helper'

module Fusion
  describe 'LeadRulesEngine' do
    subject(:validator) { LeadRulesEngine }

    let(:company) { mock_model('Company', ein: '') }
    let(:lead) { mock_model('Lead', company: company) }

    describe 'with violations' do
      it 'returns true when valid' do
        result = validator.validate(lead)
        expect(result.valid?).to eq(true)
      end
    end

    # describe 'without violations' do
    #   let(:broker_rules) do
    #     instance_double('Rules::BrokerRules', unlicensed?: false, blocked?: false, not_a_broker?: false)
    #   end
    #   let(:renewal_rules) { instance_double('Rules::RenewalRules', not_renewable?: true, past_due_loan?: false) }

    #   before do
    #     allow(Rules::RenewalRules).to receive(:new).and_return(renewal_rules)
    #     allow(Rules::BrokerRules).to receive(:new).and_return(broker_rules)
    #   end

    #   it 'returns false when invalid' do
    #     result = validator.validate(lead)
    #     expect(result.valid?).to eq(false)
    #   end
    # end
  end
end
