class CreateReadings < ActiveRecord::Migration[6.0]
  def change
    create_table :readings do |t|
      t.uuid :uuid, default: "gen_random_uuid()", null: false
      t.datetime :datetime
      t.jsonb :data
      t.references :device, foreign_key: true

      t.timestamps
    end
  end
end
