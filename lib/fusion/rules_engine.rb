# frozen_string_literal: true

## Inside the implementation class, specify the rules:

# Class MyBusinessRulesEngine
# rule :name_of_rule,
#       description: describe the rule (optional)
#       priority: 10,
#       validate: lambda {|o| # do something with o}
#       fail: lambda {|o| o.fail!}}
#
##
## Then, run the engine by calling the `process_rules` method:
##
#   self.process
#     process_rules(your_data_set)
#   end
# end
#
require 'active_support'

module Fusion
  module RulesEngine
    class DuplicateRuleError < ArgumentError; end

    extend ActiveSupport::Concern

    included do
      class_attribute :rules, :violations, :rule_names
      attr_accessor :lead

      self.rules = RuleSet.new
      self.violations = []

      def initialize(lead)
        @lead = lead
      end

      def save
        EngineRun.create do |e|
          e.rules = rule_names
          e.violations = violations
          e.lead = lead
        end
      end

      def valid?
        violations.empty?
      end
    end

    module ClassMethods
      ACCEPTED_OPTIONS = %i[name description priority validate success fail violation].freeze

      def rule(name, options = {})
        # Check if any of the given options are invalid
        invalid_options = options.keys - ACCEPTED_OPTIONS
        raise ArgumentError, "Invalid option(s): #{invalid_options.join(', ')}" if invalid_options.any?

        raise DuplicateRuleError, "Rule #{name} already exists" if rule_already_added?(name)

        rule = RulesEngine::Rule.new(name, options)
        rules << rule
        rule
      end

      def process_rules(lead)
        raise ArgumentError, 'lead must have an id' unless lead.respond_to?(:id) && lead.id.is_a?(Numeric)

        engine = new(lead)
        engine.violations = []
        engine.rule_names = []

        rules.sort_by(&:priority).each do |rule|
          result = rule.run(lead)
          engine.rule_names.append(rule.name)
          engine.violations.append(result.violation) if result.violation.present?
        end

        engine
      end

      private

      def rule_already_added?(rule)
        rules.any? { |r| r.name == rule }
      end
    end

    class Rule
      attr_accessor(*RulesEngine::ClassMethods::ACCEPTED_OPTIONS)
      attr_writer :fail

      NO_OP = ->(_o) { true }

      def initialize(name, options = {})
        self.name = name
        self.description = options[:description]
        self.priority = options[:priority] || 10
        self.validate = options[:validate] || NO_OP
        self.fail = options[:fail] || NO_OP
        self.success = options[:success] || NO_OP
        self.violation = nil
      end

      def run(object)
        self.violation = nil

        if validate.call(object)
          fail.call(object)
        else
          success.call(object)
        end

        self
      end

      def fail
        self.violation = name
        @fail
      end
    end
  end

  class RuleSet < Array
    def [](key)
      find { |rule| rule.name == key }
    end
  end
end
