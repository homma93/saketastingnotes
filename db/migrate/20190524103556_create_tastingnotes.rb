class CreateTastingnotes < ActiveRecord::Migration[5.2]
  def change
    create_table :tastingnotes do |t|
      t.references :account, foreign_key: true
      t.references :sake, foreign_key: true
      t.integer :deleted_at
      t.string :tasting_day
      t.integer :sake_kind
      t.string :sake_supplement
      t.integer :how_to_drink
      t.integer :color
      t.integer :smell
      t.string :smell_supplement
      t.integer :sweet_taste
      t.integer :acidity
      t.integer :bitter_taste
      t.integer :umami
      t.integer :alcohol
      t.string :taste_supplement
      t.string :image
      t.string :tumami_image1
      t.string :tumami_image2
      t.string :tumami_image3
      t.text :comment
      t.integer :evaluation

      t.timestamps
    end
  end
end
