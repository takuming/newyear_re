class AddContentToGoals < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :reason, :text
    add_column :goals, :people, :text
    add_column :goals, :environment, :text
  end
end
