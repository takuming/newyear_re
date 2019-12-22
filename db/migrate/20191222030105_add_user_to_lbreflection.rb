class AddUserToLbreflection < ActiveRecord::Migration[5.2]
  def change
    add_reference :lbreflections, :user_id, after: :id
  end
end
