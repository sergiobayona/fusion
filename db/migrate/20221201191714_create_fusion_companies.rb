class CreateFusionCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :fusion_companies do |t|
      t.string :legal_name
      t.date :incorporation_date
      t.string :ein
      t.string :phone_work
      t.string :email
      t.string :dba
      t.string :type_inc
      t.string :url
      t.bigint :lead_id
      t.bigint :nucleus_company_id

      t.timestamps
    end

    add_index :fusion_companies, :lead_id
    add_index :fusion_companies, :ein
    add_index :fusion_companies, :nucleus_company_id
  end
end
