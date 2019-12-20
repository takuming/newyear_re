class AddUserToGoals < ActiveRecord::Migration[5.2]
  def change
    add_reference :goals, :user, after: :id
  end
end
