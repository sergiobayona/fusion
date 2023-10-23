class CreateFusionAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :fusion_addresses do |t|
      t.string :street_number
      t.string :street_name
      t.string :unit
      t.string :city
      t.string :state
      t.string :zip
      t.string :addressable_type
      t.bigint :addressable_id

      t.timestamps
    end

    add_index :fusion_addresses, [:addressable_type, :addressable_id], name: :index_on_addressable_columns
  end
end
