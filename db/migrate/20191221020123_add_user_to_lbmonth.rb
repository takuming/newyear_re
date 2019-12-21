class AddUserToLbmonth < ActiveRecord::Migration[5.2]
  def change
    add_reference :lbmonths, :user_id, after: :id
  end
end
