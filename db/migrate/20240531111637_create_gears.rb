class CreateGears < ActiveRecord::Migration[7.1]
  def change
    create_table :gears do |t|
      t.string :title
      t.text :description
      t.decimal :price_per_day
      t.string :category
      t.boolean :availability
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
