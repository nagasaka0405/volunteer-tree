class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.string :file_path

      t.timestamps
    end
  end
end
