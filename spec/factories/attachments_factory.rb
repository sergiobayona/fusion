# frozen_string_literal: true

# rubocop:disable Style/MixinUsage
include ActionDispatch::TestProcess

FactoryBot.define do
  factory :attachment, class: 'Fusion::Attachment' do
    file { fixture_file_upload('spec/fixtures/bank_statement.jpg') }
    file_type { 'bank_statement' }
  end
end
# rubocop:enable Style/MixinUsage
