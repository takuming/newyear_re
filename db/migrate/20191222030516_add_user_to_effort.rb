class AddUserToEffort < ActiveRecord::Migration[5.2]
  def change
    add_reference :efforts, :user_id, after: :id
  end
end
