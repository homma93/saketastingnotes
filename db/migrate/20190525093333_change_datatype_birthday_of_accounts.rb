class ChangeDatatypeBirthdayOfAccounts < ActiveRecord::Migration[5.2]
  def change
    change_column :accounts, :birthday, :date
  end
end
