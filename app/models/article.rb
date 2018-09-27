class Article < ApplicationRecord
  belongs_to :category
  belongs_to :moderator

  validates :title, presence: true

  scope :categorized, -> {order(:category_id, :id)}

  scope :barnehagen, -> { where(publish: true, :category_id => '1') }
  scope :ommontessori, -> { where(publish: true, :category_id => '3') }
  scope :satsingsomrade, -> { where(publish: true, :category_id => '4').order(:id) }
  scope :skole, -> { where(publish: true, :category_id => '2') }
  scope :informasjon, -> { where(publish: true, :category_id => '5') }
  
  scope :list, -> { order(:category_id, :id) }
  
  mount_uploader :image, ImageUploader

end

  
