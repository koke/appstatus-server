class Report < ActiveRecord::Base
  VALID_CAUSES = %w(unknown serverconnect dataparse custom)
  
  belongs_to :app
  validates_presence_of :app_id, :app_version
  validates_inclusion_of :cause, :in => VALID_CAUSES
end
