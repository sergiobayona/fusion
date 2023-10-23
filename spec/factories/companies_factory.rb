# frozen_string_literal: true

FactoryBot.define do
  factory :company, class: 'Fusion::Company' do
    legal_name { 'ACME inc' }
    incorporation_date { '2002-12-01' }
    ein { '99-9999999' }
    phone_work { '999-999-9999' }
    email { 'company@example.com' }
    dba { 'ACME' }
    type_inc { 'corporation' }
    url { 'http://www.example.com' }
    address_attributes { attributes_for(:address) }
  end
end
