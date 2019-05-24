class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.references :todofuken, foreign_key: true
      t.integer :deleted_at
      t.string :mail_address
      t.string :account_name
      t.string :birthday  # yyymmdd 
      t.integer :sex  # 0：男性 1：女性 3：その他
      t.string :password_digest
      t.integer :public_private # 0：公開 1：非公開
      
      t.timestamps
    end
  end
end
