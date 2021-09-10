class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :title,                           null: false
      t.integer :prefectures_id
      t.string :municipalities
      t.integer :category_id
      t.references :room,                  null: false, foreign_key: true
      t.references :user,                  null: false, foreign_key: true
      t.timestamps
    end
  end
end
