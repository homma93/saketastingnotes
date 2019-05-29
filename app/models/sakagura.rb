class Sakagura < ApplicationRecord
  has_many :sakes
  belongs_to :todofuken, optional: true
end
