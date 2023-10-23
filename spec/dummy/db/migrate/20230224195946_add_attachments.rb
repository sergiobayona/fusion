class AddAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.string :title
      t.datetime :created_on
      t.text :note
      t.integer :user_id
      t.datetime :updated_on
      t.string :object_type
      t.integer :object_id
      t.string :state
      t.datetime :deleted_on
      t.integer :size
      t.string :content_type
      t.string :filename
      t.integer :height
      t.integer :width
      t.integer :parent_id
      t.string :thumbnail
      t.string :type
      t.integer :uploaded_by
      t.text :file
    end
  end
end
