class CreateTodofukens < ActiveRecord::Migration[5.2]
  def change
    create_table :todofukens do |t|
      t.integer :deleted_at
      t.string :todofuken_name
      t.string :region
      t.string :kumiai_name
      t.string :kumiai_url
      t.integer :sakagura_num

      t.timestamps
    end
  end
end
