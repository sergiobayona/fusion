class EngineRun < ActiveRecord::Migration[5.2]
  def change
    create_table :fusion_engine_runs do |t|
      t.json :rules
      t.json :violations
      t.bigint :lead_id

      t.timestamps
    end

    add_index :fusion_engine_runs, :lead_id
  end
end
