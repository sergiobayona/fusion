# frozen_string_literal: true

class AddAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :civic
      t.string :street
      t.string :unit
      t.string :city
      t.string :province
      t.string :zip
      t.string :contact_name
      t.string :status
      t.string :created_at
      t.string :updated_at
      t.string :valid_from
      t.string :data
      t.string :type
      t.integer :bank_id
      t.integer :country_id
    end
  end
end
