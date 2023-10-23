# frozen_string_literal: true

require 'rails_helper'

module Fusion
  RSpec.describe RulesEngine::Rule, type: :model do
    let(:name) { 'Test Rule' }
    let(:rule) do
      described_class.new(name,
                          priority: 1,
                          description: 'Test Description',
                          validate: ->(_lead) { true })
    end

    it 'returns an instance of itself' do
      expect(rule).to be_a(described_class)
    end

    it 'has a name' do
      expect(rule.name).to eq(name)
    end

    it 'has a priority' do
      expect(rule.priority).to eq(1)
    end

    it 'has a description' do
      expect(rule.description).to eq('Test Description')
    end

    it 'has a nil violation' do
      expect(rule.violation).to eq(nil)
    end

    describe 'when executing the run method' do
      let(:lead) { mock_model('Lead') }

      it 'returns itself' do
        result = rule.run(lead)
        expect(result).to be_a(described_class)
      end

      it 'in invokes the validate proc' do
        expect(rule.validate).to receive(:call).with(lead)
        rule.run(lead)
      end

      it 'invokes the fail proc' do
        expect(rule.fail).to receive(:call).with(lead)
        rule.run(lead)
      end

      it 'returns a result with a violation' do
        result = rule.run(lead)
        expect(result.violation).to eq(name)
      end
    end

    describe 'when validate returns false' do
      let(:rule) do
        described_class.new('non failing rule',
                            priority: 1,
                            description: 'Test Description',
                            fail: ->(_lead) { raise 'fail proc should not be called' },
                            validate: ->(_lead) { false })
      end

      it 'does not set a violation' do
        result = rule.run(mock_model('Lead'))

        expect(result.violation).to eq(nil)
      end

      it 'does not invoke the fail proc' do
        expect(rule.fail).not_to receive(:call)
        rule.run(mock_model('Lead'))
      end

      it 'invokes the success proc' do
        expect(rule.success).to receive(:call)
        rule.run(mock_model('Lead'))
      end
    end
  end
end
