class Region < ActiveRecord::Base
  has_many :cons
  has_many :systems
end
