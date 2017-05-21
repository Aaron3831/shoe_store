class Price < ActiveRecord::Base
  has_many :costs
  has_many :shoes, through: :costs

  validates(:total, {:uniqueness => true, :presence => true, :length => { :maximum => 100 }})
end
