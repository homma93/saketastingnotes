class ChangeDatatypeTastingDayOfTastingnotes < ActiveRecord::Migration[5.2]
  def change
    change_column :tastingnotes, :tasting_day, :date
  end
end
