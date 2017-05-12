class Store < ActiveRecord::Base
  has_many :franchises
  has_many :shoes, through: :franchises
end
