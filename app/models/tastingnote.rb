class Tastingnote < ApplicationRecord
  before_save { self.deleted_at = 0 }
  
  validates :sake_id, presence: true
  validates :tasting_day, presence: true
  validates :sake_supplement, length: { maximum: 255 }
  validates :smell_supplement, length: { maximum: 255 }
  validates :taste_supplement, length: { maximum: 255 }
  validates :comment, length: { maximum: 400 }
  validates :evaluation, presence: true

  mount_uploader :image, ImageUploader
  mount_uploader :tumami_image1, ImageUploader
  mount_uploader :tumami_image2, ImageUploader
  mount_uploader :tumami_image3, ImageUploader
  
  belongs_to :account, optional: true
  belongs_to :sake, optional: true
  
end
