# frozen_string_literal: true

module Fusion
  module Helpers
    def address_params
      {
        street_number: '1',
        street_name: 'Main St',
        unit: 'Apt. 2',
        city: 'NYC',
        state: 'NY',
        zip: '10001'
      }
    end

    # rubocop:disable Metrics/MethodLength
    def lead_params
      {
        lead: {
          company_attributes: {
            first_name: 'ACME',
            last_name: 'inc.',
            ein: '99-9999999',
            phone_work: '999-999-9999',
            industry: 'appraisers',
            industry_category: 'administrative',
            type_inc: 'corporation',
            business_start_month: '12',
            business_start_year: '2002',
            email: 'company@example.com',
            address_attributes: address_params
          },
          owners_attributes: [
            {
              first_name: 'John',
              last_name: 'Doe',
              phone_mobile: '999-999-9999',
              email: 'john@example.com',
              ssn: '999-99-9999',
              birthdate: '1980-01-01',
              address_attributes: address_params
            }
          ],
          offer_attributes: {
            amount: '20000',
            reason: 'inventory',
            payment_frequency: 'daily',
            terms: '6',
            description: 'test'
          },
          attachments_attributes: [
            {
              file: fixture_file_upload('spec/fixtures/bank_statement.jpg')
            }
          ],
          broker_id: 'w464-171-77025'
        }
      }
    end
    # rubocop:enable Metrics/MethodLength

    def json_headers
      {
        "Content-Type": 'application/json;',
        "Accept": 'application/json',
        "Authorization": 'abc123'
      }
    end
  end
end
