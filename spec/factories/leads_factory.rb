# frozen_string_literal: true

FactoryBot.define do
  factory :lead, class: 'Fusion::Lead' do
    company { association(:company) }
    offer { association(:offer) }
    owners { [association(:owner)] }
  end
end
