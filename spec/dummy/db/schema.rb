# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_02_24_195946) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.integer "user_id"
    t.string "civic"
    t.string "street"
    t.string "unit"
    t.string "city"
    t.string "province"
    t.string "zip"
    t.string "contact_name"
    t.string "status"
    t.string "created_at"
    t.string "updated_at"
    t.string "valid_from"
    t.string "data"
    t.string "type"
    t.integer "bank_id"
    t.integer "country_id"
  end

  create_table "attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "title"
    t.datetime "created_on"
    t.text "note"
    t.integer "user_id"
    t.datetime "updated_on"
    t.string "object_type"
    t.integer "object_id"
    t.string "state"
    t.datetime "deleted_on"
    t.integer "size"
    t.string "content_type"
    t.string "filename"
    t.integer "height"
    t.integer "width"
    t.integer "parent_id"
    t.string "thumbnail"
    t.string "type"
    t.integer "uploaded_by"
    t.text "file"
  end

  create_table "fusion_addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "street_number"
    t.string "street_name"
    t.string "unit"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_on_addressable_columns"
  end

  create_table "fusion_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "filename"
    t.string "file_type"
    t.string "file"
    t.string "state"
    t.string "size"
    t.string "content_type"
    t.bigint "offer_id"
    t.bigint "uploaded_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_fusion_attachments_on_offer_id"
  end

  create_table "fusion_companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "legal_name"
    t.date "incorporation_date"
    t.string "ein"
    t.string "phone_work"
    t.string "email"
    t.string "dba"
    t.string "type_inc"
    t.string "url"
    t.bigint "lead_id"
    t.bigint "nucleus_company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ein"], name: "index_fusion_companies_on_ein"
    t.index ["lead_id"], name: "index_fusion_companies_on_lead_id"
    t.index ["nucleus_company_id"], name: "index_fusion_companies_on_nucleus_company_id"
  end

  create_table "fusion_engine_runs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.json "rules"
    t.json "violations"
    t.bigint "lead_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lead_id"], name: "index_fusion_engine_runs_on_lead_id"
  end

  create_table "fusion_leads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "source"
    t.integer "broker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["broker_id"], name: "index_fusion_leads_on_broker_id"
  end

  create_table "fusion_offers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "amount"
    t.string "purpose"
    t.string "description"
    t.string "length_max"
    t.string "pmt_frequency"
    t.bigint "lead_id"
    t.bigint "nucleus_offer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lead_id"], name: "index_fusion_offers_on_lead_id"
    t.index ["nucleus_offer_id"], name: "index_fusion_offers_on_nucleus_offer_id"
  end

  create_table "fusion_owners", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.boolean "primary_guarantor"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_mobile"
    t.string "phone"
    t.date "birthdate"
    t.string "ssn"
    t.string "owner_percent"
    t.string "permalink"
    t.bigint "lead_id"
    t.bigint "nucleus_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lead_id"], name: "index_fusion_owners_on_lead_id"
    t.index ["nucleus_user_id"], name: "index_fusion_owners_on_nucleus_user_id"
  end

  create_table "offers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.text "description"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.datetime "start_date"
    t.datetime "end_date"
    t.decimal "amount", precision: 10
    t.decimal "rate", precision: 10
    t.integer "length_max"
    t.decimal "contract_amount", precision: 10
    t.integer "nonpay_status"
    t.datetime "nonpay_date"
    t.datetime "reserved_at"
    t.decimal "requested_amount", precision: 10
    t.integer "topic_id"
    t.text "description_html"
    t.string "permalink"
    t.string "purpose"
    t.string "payment_type"
    t.decimal "bids_amount", precision: 10
    t.decimal "amount_nsf_unpaid", precision: 10
    t.string "loan_state"
    t.string "offer_state"
    t.decimal "ratio_di", precision: 10
    t.decimal "suggested_rate", precision: 10
    t.string "cached_state"
    t.string "active_state"
    t.integer "score_bni"
    t.integer "score_vantage"
    t.integer "score_iou"
    t.text "data"
    t.string "late_status"
    t.string "writeoff_status"
    t.integer "workflow_user"
    t.string "workflow_state"
    t.string "workflow_stage"
    t.datetime "workflow_time"
    t.string "accord_state"
    t.string "opt_status"
    t.integer "workflow_urgency"
    t.integer "from_broker_id"
    t.datetime "t0date"
    t.integer "workflow_importance"
    t.datetime "activation_time"
    t.string "loan_category"
    t.integer "current_lender_id"
    t.text "cache"
    t.string "from_broker_permalink"
    t.integer "workflow_processor_id"
    t.integer "workflow_underwriter_id"
    t.string "legal_status"
    t.datetime "legal_status_date"
    t.decimal "cd_loan_amount", precision: 10
    t.integer "cd_loan_term"
    t.decimal "cd_loan_rate", precision: 10
    t.datetime "cd_preparation_date"
    t.datetime "cd_loan_start_date"
    t.decimal "cd_gfee_rate", precision: 10
    t.decimal "cd_closing_fee", precision: 10
    t.decimal "cd_regular_repayment_amount", precision: 10
    t.integer "cd_payment_count"
    t.date "cd_pay_date_first"
    t.date "cd_pay_date_last"
    t.decimal "cd_total_interest", precision: 10
    t.date "cd_interest_start_date"
    t.decimal "cd_last_pay_amount", precision: 10
    t.decimal "cd_gfee_payment", precision: 10
    t.decimal "cd_gfee_total", precision: 10
    t.decimal "cd_payment_with_gfee", precision: 10
    t.decimal "cd_ratio_di", precision: 10
    t.decimal "cd_nsf_fee", precision: 10
    t.integer "eligible_for_renewal"
    t.integer "eligible_for_renewal_in_days"
    t.decimal "uw_amount_net", precision: 10
    t.datetime "estimated_closing_date"
    t.datetime "loan_closing_invite"
    t.string "state_of_loan"
    t.integer "promo_code_id"
    t.string "promo_method"
    t.string "channel"
    t.integer "primary_guarantor_id"
    t.integer "allow_accept_funding"
    t.date "application_date"
    t.datetime "contract_sold_date"
    t.datetime "resolved_at"
    t.integer "uw_declared_as_renewal"
    t.datetime "workflow_underwriter_date"
    t.datetime "workflow_processor_date"
    t.integer "workflow_renewal_specialist_id"
    t.datetime "workflow_renewal_specialist_date"
    t.integer "workflow_audited"
    t.integer "is_renewed"
    t.integer "is_renewal"
    t.integer "renew_from_id"
    t.integer "country_id"
    t.integer "has_lender_deposit_statements"
    t.integer "money_mart"
    t.integer "iou_score_value"
    t.string "iou_score_letter"
    t.string "renewal_status"
    t.integer "workflow_lead_originator_id"
    t.string "renewal_type"
    t.string "pmt_frequency"
    t.datetime "workflow_lead_originator_date"
    t.string "cd_payment_frequency"
    t.string "payoff_received_from"
    t.integer "payoff_resolved"
    t.string "payoff_request_processed"
    t.string "payoff_request_type"
    t.string "payoff_request_reason"
    t.date "payoff_request_on"
    t.integer "payoff_request_amount"
    t.string "collection_status"
    t.integer "sent_investor_referral"
    t.integer "investor_referral_id"
    t.datetime "sent_investor_referral_on"
    t.datetime "investor_reviewed_on"
    t.integer "investor_reviewal"
    t.integer "auto_change_payment_plan"
    t.string "next_payment_plan"
    t.datetime "investor_unreferred_on"
    t.integer "reage_no"
    t.string "lien_position"
    t.string "score_tier"
    t.integer "management_exception"
    t.integer "exception_by"
    t.integer "broker_contact_id"
    t.integer "eligible_for_renewal_with_balance"
    t.integer "workflow_closer_id"
    t.datetime "workflow_closer_date"
    t.integer "cd_interest_method"
    t.integer "is_ecoa_notice_sent"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "login"
    t.string "encrypted_cpr"
    t.string "first_name"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.datetime "last_login"
    t.string "created_by"
    t.string "status"
    t.string "last_name"
    t.integer "enabled"
    t.string "salt"
    t.string "remember_token"
    t.string "password_reset_code"
    t.string "activation_code"
    t.datetime "remember_token_expires_at"
    t.datetime "activated_at"
    t.string "gender"
    t.datetime "birthdate"
    t.string "email"
    t.string "email_confirmed"
    t.string "phone"
    t.string "phone_work"
    t.string "lender_type"
    t.text "description"
    t.string "permalink"
    t.string "type"
    t.string "register_as"
    t.string "phone_mobile"
    t.string "middle_initial"
    t.string "name_suffix"
    t.integer "parent_id"
    t.text "annotations"
    t.string "industry"
    t.string "other_industry"
    t.string "state_inc"
    t.string "type_inc"
    t.datetime "owner_since"
    t.integer "workflow_user"
    t.string "workflow_state"
    t.string "workflow_stage"
    t.datetime "workflow_time"
    t.integer "from_broker_id"
    t.string "from_broker_permalink"
    t.integer "workflow_urgency"
    t.string "password_hash"
    t.string "contact_person_name"
    t.string "heard_from"
    t.integer "default_locale_id"
    t.integer "default_country_id"
    t.integer "broker_country_id"
    t.string "industry_category"
    t.string "encrypted_password"
    t.integer "failed_attempts"
    t.string "unlock_token"
    t.datetime "locked_at"
  end

end
