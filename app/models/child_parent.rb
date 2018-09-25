class ChildParent < ApplicationRecord
  belongs_to :child
  belongs_to :parent
end
