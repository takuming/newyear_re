class RemoveUserFromLbmonths < ActiveRecord::Migration[5.2]
  def change
    remove_column :lbmonths, :user_id, after: :id
  end
end
