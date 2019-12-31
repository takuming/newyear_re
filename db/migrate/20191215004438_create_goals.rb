class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :title, null: true, default: "サンプル"
      t.text :action, null: true
      t.text , null: true
      t.text :reason, null: true
      t.text :people, null: true
      t.text :environment, null: true
      t.timestamps
    end
  end
end
