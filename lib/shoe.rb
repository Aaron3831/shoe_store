class Shoe < ActiveRecord::Base
  has_many :costs
  has_many :franchises
  has_many :prices, through: :costs
  has_many :stores, through: :franchises
end
