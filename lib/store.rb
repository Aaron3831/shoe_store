class Store < ActiveRecord::Base

  has_many :franchises
  has_many :shoes, through: :franchises

  validates(:title, {:presence => true, :length => { :maximum => 100 }})

  validates(:title, :presence => true)

  before_save(:capitalize_title)

  scope(:not_done, -> do
    where({:done => false})
  end)

  private

  define_method(:capitalize_title) do
    self.title=(title().capitalize())
  end
end
