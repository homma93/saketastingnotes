class CreateSakes < ActiveRecord::Migration[5.2]
  def change
    create_table :sakes do |t|
      t.references :sakagura, foreign_key: true
      t.integer :deleted_at
      t.string :meigara_name

      t.timestamps
    end
  end
end
