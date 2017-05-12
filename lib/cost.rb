class Cost < ActiveRecord::Base
  belongs_to :shoe
  belongs_to :price
end
