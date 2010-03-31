class App < ActiveRecord::Base
  has_attached_file :icon, :styles => { :medium => "512x512>", :thumb => "57x57>" }
  validates_presence_of :app_id, :name, :bundle_id
  validates_uniqueness_of :app_id, :on => :create, :message => "must be unique"  
  validates_uniqueness_of :bundle_id, :on => :create, :message => "must be unique"
  has_many :reports, :include => :app do
    def this_version
      find(:all, :conditions => ["reports.app_version = apps.version AND ignored = ?", false])
    end
  end
  
  def status
    return :confirmed if broken
    return :probably unless reports.this_version.empty?
    return :working
  end
end
