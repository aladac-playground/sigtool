class Sig < ActiveRecord::Base
  belongs_to :type
  belongs_to :group
  belongs_to :scan
end
