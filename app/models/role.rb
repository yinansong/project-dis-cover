class Role < ActiveRecord::Base
  has_many :collectors
end
