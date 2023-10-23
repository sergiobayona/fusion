class CreateFusionOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :fusion_offers do |t|
      t.string :amount
      t.string :purpose
      t.string :description
      t.string :length_max
      t.string :pmt_frequency
      t.bigint :lead_id
      t.bigint :nucleus_offer_id
      t.timestamps
    end

    add_index :fusion_offers, :lead_id
    add_index :fusion_offers, :nucleus_offer_id
  end
end
