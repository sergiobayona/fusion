class CreateFusionOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :fusion_owners do |t|
      t.boolean :primary_guarantor
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_mobile
      t.string :phone
      t.date :birthdate
      t.string :ssn
      t.string :owner_percent
      t.string :permalink
      t.bigint :lead_id
      t.bigint :nucleus_user_id

      t.timestamps
    end

    add_index :fusion_owners, :lead_id
    add_index :fusion_owners, :nucleus_user_id
  end
end
