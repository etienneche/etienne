class ProductStyle < ApplicationRecord
  belongs_to :style
  belongs_to :product
end
