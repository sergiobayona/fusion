# frozen_string_literal: true

FactoryBot.define do
  factory :address, class: 'Fusion::Address' do
    street_number { '123' }
    street_name { 'Main St' }
    unit { '201' }
    city { 'New York' }
    state { 'NY' }
    zip { '10001' }
  end
end
