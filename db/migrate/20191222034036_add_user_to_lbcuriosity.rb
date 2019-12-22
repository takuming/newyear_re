class AddUserToLbcuriosity < ActiveRecord::Migration[5.2]
  def change
    add_reference :lbcuriosities, :user_id, after: :id
  end
end
