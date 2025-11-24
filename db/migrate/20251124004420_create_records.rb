class CreateRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :records do |t|
      t.references :user, foreign_key: true
      t.references :image, foreign_key: true
      t.references :category, foreign_key: true
      t.text :content
      t.integer :star_rating
      t.integer :status, default: 0, null: false # enum用のカラム
      t.timestamps
    end
  end
end
