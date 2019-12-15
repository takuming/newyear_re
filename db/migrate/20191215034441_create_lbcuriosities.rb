class CreateLbcuriosities < ActiveRecord::Migration[5.2]
  def change
    create_table :lbcuriosities do |t|
      t.text :trance, null: true
      t.text :positive, null: true
      t.text :interesting, null: true
      t.text :comfortable, null: true
      t.text :theme, null: true
      t.text :investment, null: true

      t.timestamps
    end
  end
end
