class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name, null: false, limit: 80
      t.integer :book_id, null: false

      t.timestamps
    end

    add_index :authors, :book_id
  end
end
