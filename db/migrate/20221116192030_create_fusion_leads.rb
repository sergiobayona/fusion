class CreateFusionLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :fusion_leads do |t|
      t.string :source
      t.integer :broker_id

      t.timestamps
    end

    add_index :fusion_leads, :broker_id
  end
end
