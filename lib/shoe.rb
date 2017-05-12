class Shoe < ActiveRecord::Base
  has_many :costs
  has_many :franchises
  has_many :prices, through: :costs
  has_many :stores, through: :franchises

  validates(:brand, {:presence => true, :length => { :maximum => 100 }})

  validates(:brand, :presence => true)

  before_save(:capitalize_brand)

  scope(:not_done, -> do
    where({:done => false})
  end)

  private

  define_method(:capitalize_brand) do
    self.brand=(brand().capitalize())
  end
end
