class Department < ApplicationRecord
  belongs_to :school
  has_many :employees
  has_many :children, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :meetings, dependent: :destroy
  has_many :galleries, dependent: :destroy
  has_many :documents, dependent: :destroy

  mount_uploader :image, ImageUploader
end
