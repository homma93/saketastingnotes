class Account < ApplicationRecord
  before_save { self.mail_address.downcase! }
  validates :todofuken_id, presence: true
  validates :mail_address, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :account_name, presence: true, length: { maximum: 50 }
  validates :birthday, presence: true, length: { is: 8 }
  validates :sex, presence: true, length: { is: 1 }
  validates :password_digest, presence: true, length: { in: 8..50 },
                    confirmation: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,50}+\z/i} 
  validates :public_private, presence: true, length: { is: 1 }
  has_secure_password
end
