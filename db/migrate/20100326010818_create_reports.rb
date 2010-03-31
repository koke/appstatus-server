class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.integer :app_id
      t.string :cause
      t.string :details
      t.string :app_version
      t.string :device_id
      t.string :remote_addr

      t.timestamps
    end
  end

  def self.down
    drop_table :reports
  end
end
