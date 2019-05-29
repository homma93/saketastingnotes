class Sake < ApplicationRecord
  has_many :tastingnotes
  belongs_to :sake, optional: true
end
