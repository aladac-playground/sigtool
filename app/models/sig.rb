class Sig < ActiveRecord::Base
  belongs_to :type
  belongs_to :group
  belongs_to :scan
  belongs_to :system
  validates_uniqueness_of :sig_id, :scope => [ :system_id, :scan_id ]
  validates_format_of :sig_id, :with => /^[A-Z]{3}-\d{3}$/, :multiline => true
end
