class AddregionTotodofukens < ActiveRecord::Migration[5.2]
  def change
    add_column :todofukens, :region_id, :integer
  end
end
