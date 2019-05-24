class CreateSakaguras < ActiveRecord::Migration[5.2]
  def change
    create_table :sakaguras do |t|
      t.references :todofuken, foreign_key: true
      t.integer :deleted_at
      t.string :sakagura_name

      t.timestamps
    end
  end
end
