class CreateEfforts < ActiveRecord::Migration[5.2]
  def change
    create_table :efforts do |t|
      t.text :change, null: true
      t.text :keep, null: true
      t.text :challenge, null: true
      t.text :influence, null: true
      t.text :surround, null: true
      t.text :endofyear, null: true

      t.timestamps
    end
  end
end
