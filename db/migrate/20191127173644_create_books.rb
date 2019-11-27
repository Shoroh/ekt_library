class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.text :description, null: false
      t.string :image, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
