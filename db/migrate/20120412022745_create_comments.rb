class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :book_id
      t.integer :user_id
      t.string :comment

      t.timestamps
    end
  end
end
