class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :title,          null: false
      t.text :info,             null: false
      t.integer :category_id,   null: false
      t.integer :status_id,    null: false
      t.integer :fee_id,        null: false
      t.integer :prefecture_id, null: false
      t.integer :schedule_id,   null: false
      t.integer :price,         null: false
      t.references :user,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
