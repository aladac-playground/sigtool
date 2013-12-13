class Sig < ActiveRecord::Base
  belongs_to :type
  belongs_to :group
  belongs_to :scan
  belongs_to :system
  validates_uniqueness_of :sig_id
end
