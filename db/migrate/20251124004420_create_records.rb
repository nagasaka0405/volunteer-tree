class CreateRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :records do |t|
      t.references :user, foreign_key: true, null: false
      t.references :prefecture, foreign_key: true, null: false
      t.text :content
      t.integer :star_rating, null: false
      t.integer :status, default: 0, null: false # enum用のカラム
      t.timestamps
    end
  end
end
