class Tastingnote < ApplicationRecord
  
  mount_uploader :image, ImageUploader
  mount_uploader :tumami_image1, ImageUploader
  mount_uploader :tumami_image2, ImageUploader
  mount_uploader :tumami_image3, ImageUploader
  
  belongs_to :account, optional: true
  belongs_to :sake, optional: true
end
