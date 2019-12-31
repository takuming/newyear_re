class RemoveUserIdIdFromEfforts < ActiveRecord::Migration[5.2]
  def change
    remove_column :efforts, :user_id_id, after: :id
  end
end
