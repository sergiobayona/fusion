# frozen_string_literal: true

FactoryBot.define do
  factory :owner, class: 'Fusion::Owner' do
    primary_guarantor { true }
    first_name { 'MyString' }
    last_name { 'MyString' }
    email { 'MyString' }
    phone_mobile { '404444444' }
    phone { '3333333333' }
    ssn { 'MyString' }
    birthdate { '2022-12-01' }
    owner_percent { '100' }
    address_attributes { attributes_for(:address) }
  end
end
