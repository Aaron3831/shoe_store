class Shoe < ActiveRecord::Base
  validates(:title, {:presence => true, :length => { :maximum => 100 }})

  has_many :costs
  has_many :franchises
  has_many :prices, through: :costs
  has_many :stores, through: :franchises

  scope(:not_done, -> do
    where({:done => false})
  end)

  private

  define_method(:capitalize_brand) do
    self.brand=(brand().capitalize())
  end
end
