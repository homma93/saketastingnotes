class Sake < ApplicationRecord
  has_many :tastingnotes
  belongs_to :sakagura, optional: true
end
