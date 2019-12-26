class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.uuid :uuid, default: "gen_random_uuid()", null: false
      t.string :name, null: false
      t.string :mac_address
      t.string :write_key
      t.string :read_key

      t.timestamps
    end
  end
end
