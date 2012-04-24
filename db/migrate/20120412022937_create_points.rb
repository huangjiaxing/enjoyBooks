class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :book_id
      t.integer :user_id
      t.integer :rank

      t.timestamps
    end
  end
end
