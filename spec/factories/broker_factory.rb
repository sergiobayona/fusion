# frozen_string_literal: true

FactoryBot.define do
  factory :broker do
    first_name { 'Butch' }
    last_name { 'Fernsby' }
    register_as { 'broker' }
    login { 'some_user' }
    password { 'SuperSecretPassword1!' }
    password_confirmation { 'SuperSecretPassword1!' }
    email { 'test@example.com' }
    phone_mobile { '15557778888' }
    agreement_tou { true }
    birthdate { 3.years.ago }
    status { 'accepted' }
    phone_work { '14045559494' }
    default_country_id { 1 }
    cpr { '59-7726812' }
    type_inc { 'inc_type_corporation' }
  end
end
