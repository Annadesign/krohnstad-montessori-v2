class Attachment < ApplicationRecord
  belongs_to :article

  validates :attachment, presence: true
  validates :description, presence: true


  mount_uploader :attachment, DocumentUploader
end
