class Article < ApplicationRecord
  belongs_to :category
  belongs_to :moderator
  has_many :attachments

  validates :title, presence: true

  scope :categorized, -> {order(:category_id, :id)}

  scope :barnehagen, -> { where(publish: true, :category_id => '1').order(:position) }
  scope :ommontessori, -> { where(publish: true, :category_id => '3').order(:position) }
  scope :satsingsomrade, -> { where(publish: true, :category_id => '4').order(:position) }
  scope :skole, -> { where(publish: true, :category_id => '2').order(:position) }
  scope :informasjon, -> { where(publish: true, :category_id => '5').order(:position)  }
  scope :personvern, -> { where(publish: true, :category_id => '6').order(:position) }
  scope :list, -> { order(:category_id, :id) }
  
  mount_uploader :image, ImageUploader

end

  
