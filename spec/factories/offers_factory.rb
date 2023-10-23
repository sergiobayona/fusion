# frozen_string_literal: true

FactoryBot.define do
  factory :offer, class: 'Fusion::Offer' do
    length_max { 12 }
    amount { 100_000 }
    purpose { 'New Equipment' }
    description { 'description' }
    pmt_frequency { 'monthly' }
    attachments { [association(:attachment)] }
  end
end
