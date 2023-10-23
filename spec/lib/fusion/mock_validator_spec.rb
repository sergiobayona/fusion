# frozen_string_literal: true

require 'rails_helper'

# MockValidator is just a shell class so that we can
# include the rules engine and test its features.

module Fusion
  class MockValidator
    include RulesEngine

    rule :mybirthday,
         description: 'optional description',
         priority: 1,
         validate: ->(o) { o.date != Time.zone.today },
         fail: ->(_) { puts 'failed' }

    rule :somentfailing,
         priority: 2,
         validate: ->(_) { true } # will always fail

    rule :somepassing,
         priority: 3,
         validate: ->(_) { false } # will always pass

    def self.validate(lead)
      process_rules(lead)
    end
  end

  describe MockValidator do
    subject(:validator) { described_class }

    let(:lead_one) { mock_model('Lead', id: 123, date: Time.zone.today) }
    let(:lead_two) { mock_model('Lead', id: 123, date: Time.zone.tomorrow) }

    it 'returns an array' do
      expect(validator.rules).to be_a(Array)
    end

    it 'returns an array where the elements are rule objects' do
      expect(validator.rules.first).to be_a(RulesEngine::Rule)
    end

    it 'raises an error when we do not pass an array' do
      ['', nil, {}, OpenStruct.new].each do |obj|
        expect do
          validator.validate(obj)
        end.to raise_error ArgumentError, 'lead must have an id'
      end
    end

    it 'returns the mockvalidator class' do
      result = validator.validate(lead_one)
      expect(result).to be_a(validator)
    end

    it 'returns failing rule in the array of violations' do
      result = validator.validate(lead_two)
      expect(result.violations).to eq(%i[mybirthday somentfailing])
    end

    it 'returns a list of the rules that were executed' do
      result = validator.validate(lead_one)
      expect(result.rule_names).to eq(%i[mybirthday somentfailing somepassing])
    end

    it 'returns the rule name as error' do
      result = validator.validate(lead_one)
      expect(result.violations).to eq([:somentfailing])
    end

    it 'is not valid when there are violations' do
      result = validator.validate(lead_one)
      expect(result.valid?).to eq(false)
    end

    context 'when saving the results' do
      let!(:result) { validator.validate(lead_one) }

      it 'returns the AR object that stores the results' do
        expect(result.save).to be_a(EngineRun)
      end

      it 'persists the results' do
        record = result.save
        expect(record.persisted?).to eq(true)
      end

      it 'saves an enginerun record' do
        expect { result.save }.to change(EngineRun, :count).by(1)
      end
    end

    context 'when adding a duplicate rule' do
      it 'raises an error' do
        expect do
          validator.rule(:mybirthday)
        end.to raise_error RulesEngine::DuplicateRuleError
      end

      it 'does not add the rule' do
        expect do
          validator.rule(:mybirthday)
        rescue RulesEngine::DuplicateRuleError
          nil
        end.not_to(change { validator.rules.count })
      end
    end

    context 'when accessing the rule attributes' do
      it 'returns the rule object' do
        expect(validator.rules[:mybirthday]).to be_a(RulesEngine::Rule)
      end

      it 'returns the rule name' do
        expect(validator.rules[:mybirthday].name).to eq(:mybirthday)
      end

      it 'returns the rule description' do
        expect(validator.rules[:mybirthday].description).to eq('optional description')
      end

      it 'returns the rule priority' do
        expect(validator.rules[:mybirthday].priority).to eq(1)
      end

      it 'returns the rule validation proc' do
        expect(validator.rules[:mybirthday].validate).to be_a(Proc)
      end

      it 'returns the rule fail proc' do
        expect(validator.rules[:mybirthday].fail).to be_a(Proc)
      end
    end

    context 'when passing a rule name that does not exist' do
      it 'returns nil' do
        expect(validator.rules[:notarule]).to eq(nil)
      end
    end

    context 'when modifying a rule at run time' do
      let(:lead) { mock_model('Lead', id: 123, date: Time.zone.today) }

      before do
        # select the rule and modify it
        this_rule = validator.rules[:somentfailing]
        this_rule.validate = ->(_) { false } # will always pass
      end

      it 'does not show any violations' do
        result = validator.validate(lead)
        expect(result.violations).to eq([])
      end

      it 'is valid' do
        result = validator.validate(lead)
        expect(result.valid?).to eq(true)
      end

      it 'still listed as a rule name' do
        result = validator.validate(lead)
        expect(result.rule_names).to eq(%i[mybirthday somentfailing somepassing])
      end
    end
  end
end
