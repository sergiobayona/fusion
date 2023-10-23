# frozen_string_literal: true

class AddUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :login
      t.string :encrypted_cpr
      t.string :first_name
      t.datetime :created_on
      t.datetime :updated_on
      t.datetime :last_login
      t.string :created_by
      t.string :status
      t.string :last_name
      t.integer :enabled
      t.string :salt
      t.string :remember_token
      t.string :password_reset_code
      t.string :activation_code
      t.datetime :remember_token_expires_at
      t.datetime :activated_at
      t.string :gender
      t.datetime :birthdate
      t.string :email
      t.string :email_confirmed
      t.string :phone
      t.string :phone_work
      t.string :lender_type
      t.text :description
      t.string :permalink
      t.string :type
      t.string :register_as
      t.string :phone_mobile
      t.string :middle_initial
      t.string :name_suffix
      t.integer :parent_id
      t.text :annotations
      t.string :industry
      t.string :other_industry
      t.string :state_inc
      t.string :type_inc
      t.datetime :owner_since
      t.integer :workflow_user
      t.string :workflow_state
      t.string :workflow_stage
      t.datetime :workflow_time
      t.integer :from_broker_id
      t.string :from_broker_permalink
      t.integer :workflow_urgency
      t.string :password_hash
      t.string :contact_person_name
      t.string :heard_from
      t.integer :default_locale_id
      t.integer :default_country_id
      t.integer :broker_country_id
      t.string :industry_category
      t.string :encrypted_password
      t.integer :failed_attempts
      t.string :unlock_token
      t.datetime :locked_at
    end
  end
end
