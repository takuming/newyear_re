class CreateLbreflections < ActiveRecord::Migration[5.2]
  def change
    create_table :lbreflections do |t|
      t.text :missing, null: true
      t.text :taking, null: true
      t.text :worry, null: true
      t.text :guilt, null: true
      t.text :anger, null: true
      t.text :sorrow, null: true
      t.text :jealousy, null: true

      t.timestamps
    end
  end
end
