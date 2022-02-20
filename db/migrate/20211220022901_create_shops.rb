class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name , nil: false
      t.text :text , nil: false
      t.integer :shop_category_id , nil: false
      t.integer :prefecture_id,      null: false
      t.references :user, nil: false, foreign_key: true
      t.timestamps
    end
  end
end
