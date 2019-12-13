class CreateLbmonths < ActiveRecord::Migration[5.2]
  def change
    create_table :lbmonths do |t|
      t.text :jan, null: true
      t.text :feb, null: true
      t.text :mar, null: true
      t.text :apr, null: true
      t.text :may, null: true
      t.text :jun, null: true
      t.text :jul, null: true
      t.text :aug, null: true
      t.text :sep, null: true
      t.text :oct, null: true
      t.text :nov, null: true
      t.text :dec, null: true

      t.timestamps
    end
  end
end
