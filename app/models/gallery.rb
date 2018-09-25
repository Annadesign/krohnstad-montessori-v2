class Gallery < ApplicationRecord
  belongs_to :department
  has_many :images, dependent: :destroy
end
