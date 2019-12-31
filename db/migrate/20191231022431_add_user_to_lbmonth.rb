class AddUserToLbmonth < ActiveRecord::Migration[5.2]
  def change
    add_reference :lbmonths, :user, after: :id
  end
end
