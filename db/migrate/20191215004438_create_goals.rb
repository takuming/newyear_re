class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :title, null: true, default: "サンプル"
      t.text :action, null: true
      t.text :problem, null: true

      t.timestamps
    end
  end
end
