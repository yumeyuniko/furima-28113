class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, null: false
      # t.references :user,               null: false, foreign_key: true 外部制約を外す
      t.string :name, null: false
      t.text :explanation, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :delivery_fee_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :shipping_day_id, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
