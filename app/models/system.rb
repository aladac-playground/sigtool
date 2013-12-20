class System < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_uniqueness_of :id
  belongs_to :cons
  belongs_to :region
end
