class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :shop_name
      t.text :shop_text
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
