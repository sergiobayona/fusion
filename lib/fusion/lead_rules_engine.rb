# frozen_string_literal: true

require 'fusion/rules_engine'

module Fusion
  class LeadRulesEngine
    include RulesEngine

    # Use negative rule names and ensure that
    # a failed validation returns true for the `validate` lambda.

    rule :not_a_broker,
         priority: 0,
         validate: ->(lead) { broker_rules(lead).not_a_broker? }

    rule :blocked_broker,
         priority: 1,
         validate: lambda { |lead|
                     broker_rules(lead).blocked?
                   }

    rule :unlicensed_broker,
         priority: 2,
         validate: lambda { |lead|
                     broker_rules(lead).unlicensed?
                   }

    rule :loan_not_renewable,
         priority: 3,
         validate: lambda { |lead|
                     renewal_rules(lead).not_renewable?
                   }

    rule :not_original_broker,
         priority: 4,
         validate: lambda { |lead|
                     renewal_rules(lead).not_original_broker?
                   }

    rule :past_due_loan,
         priority: 5,
         validate: lambda { |lead|
                     renewal_rules(lead).past_due_loan?
                   }

    rule :duplicate_loan_application,
         priority: 6,
         validate: lambda { |lead|
                     conflict_rules(lead).duplicate_app?
                   }

    rule :invalid_industry,
         priority: 7,
         validate: lambda { |lead|
                     lead_rules(lead).invalid_industry?
                   }

    rule :merchant_is_too_recent,
         priority: 8,
         validate: lambda { |lead|
                     lead_rules(lead).merchant_too_recent?
                   }

    rule :owner_too_young,
         priority: 9,
         validate: lambda { |lead|
                     lead_rules(lead).owner_too_young?
                   }

    rule :invalid_state,
         priority: 10,
         validate: lambda { |lead|
                     lead_rules(lead).invalid_state?
                   }

    def self.broker_rules(lead)
      @broker_rules ||= Rules::BrokerRules.new(lead)
    end

    def self.renewal_rules(lead)
      @renewal_rules ||= Rules::RenewalRules.new(lead)
    end

    def self.conflict_rules(lead)
      @conflict_rules ||= Rules::ConflictRules.new(lead)
    end

    def self.lead_rules(lead)
      @lead_rules ||= Rules::LeadRules.new(lead)
    end

    def self.validate(lead)
      process_rules(lead)
    end
  end
end
