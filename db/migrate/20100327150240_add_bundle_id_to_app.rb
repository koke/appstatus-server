class AddBundleIdToApp < ActiveRecord::Migration
  def self.up
    add_column :apps, :bundle_id, :string, :null => false
    add_index :apps, :bundle_id, :unique => true
  end

  def self.down
    remove_index :apps, :column => :bundle_id
    remove_column :apps, :bundle_id
  end
end
