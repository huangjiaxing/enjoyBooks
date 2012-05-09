class CreateBookMarks < ActiveRecord::Migration
  def change
    create_table :book_marks do |t|
      t.integer :user_id
      t.integer :book_id
      t.string :bookmark
      t.integer :pagination

      t.timestamps
    end
  end
end
