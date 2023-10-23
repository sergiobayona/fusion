class CreateFusionAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :fusion_attachments do |t|
      t.string :filename
      t.string :file_type
      t.string :file
      t.string :state
      t.string :size
      t.string :content_type
      t.bigint :offer_id
      t.bigint :uploaded_by
      t.timestamps
    end

    add_index :fusion_attachments, :offer_id
  end
end
