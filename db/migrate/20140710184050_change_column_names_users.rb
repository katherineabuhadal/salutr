class ChangeColumnNamesUsers < ActiveRecord::Migration
  def change
    rename_column :salutes, :user_id, :sender
    rename_column :salutes, :target_user, :receiver
  end
end
