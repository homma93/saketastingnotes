class Account < ApplicationRecord
  before_save { self.mail_address.downcase!}
  before_save { self.deleted_at = 0 }
  
  validates :todofuken_id, presence: true
  validates :mail_address, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :account_name, presence: true, length: { maximum: 50 }
  validates :birthday, presence: true
  validates :sex, presence: true, length: { is: 1 }
  #validates :password_digest, presence: true, 
  #                  confirmation: true, 
  #format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,50}+\z/i} 
  validates :public_private, presence: true, length: { is: 1 }
  has_secure_password
  
  belongs_to :todofuken, optional: true
  has_many :tastingnotes
end
