class RemoveUserIdFromLbmonths < ActiveRecord::Migration[5.2]
  def change
    remove_column :lbmonths, :user
  end
end
