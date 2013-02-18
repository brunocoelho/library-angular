class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string  :title, null: false, limit: 80
      t.string  :isbn,  null: false, limit: 20
      t.date    :lending_date
      t.integer :user_id

      t.timestamps
    end

    add_index :books, :user_id
  end
end
