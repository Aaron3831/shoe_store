class Store < ActiveRecord::Base
  validates(:title, {:presence => true, :length => { :maximum => 100 }})
  has_many :franchises
  has_many :shoes, through: :franchises

  scope(:not_done, -> do
    where({:done => false})
  end)

  private

  define_method(:capitalize_title) do
    self.title=(title().capitalize())
  end
end
