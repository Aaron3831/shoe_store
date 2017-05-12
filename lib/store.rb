class Store < ActiveRecord::Base
  validates(:title, {:presence => true, :length => { :maximum => 100 }})
  has_many :franchises
  has_many :shoes, through: :franchises

  DB.exec("DELETE FROM stores WHERE id = #{self.id()};")
end
