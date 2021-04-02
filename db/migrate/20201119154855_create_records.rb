class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false #, foreign_key: true ← userを消すときにitemの出品者（削除アカウント）の関係性を解除したいため

      t.timestamps
    end
  end
end
