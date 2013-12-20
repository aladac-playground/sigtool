class Cons < ActiveRecord::Base
  has_many :systems
  belongs_to :region
end
