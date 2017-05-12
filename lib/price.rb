class Price < ActiveRecord::Base
  has_many :costs
  has_many :shoes, through: :costs
end
