class AddBrokenToApp < ActiveRecord::Migration
  def self.up
    add_column :apps, :broken, :boolean, :default => false, :null => false
  end

  def self.down
    remove_column :apps, :broken
  end
end
