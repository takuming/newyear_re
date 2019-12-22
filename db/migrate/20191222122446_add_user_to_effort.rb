class AddUserToEffort < ActiveRecord::Migration[5.2]
  def change
    add_reference :efforts, :user, after: :id
  end
end
