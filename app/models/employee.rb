class Employee < ApplicationRecord
  belongs_to :department

  validates :lastname, presence: true
  scope :by_name, -> { order(lastname: :asc) }

  mount_uploader :image, ImageUploader
end
