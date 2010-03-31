class AddEmailToReport < ActiveRecord::Migration
  def self.up
    add_column :reports, :email, :string
  end

  def self.down
    remove_column :reports, :email
  end
end
